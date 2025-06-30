<?php

namespace Orkester\Persistence;

use Illuminate\Container\Container as LaravelContainer;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Connection;
use Illuminate\Database\DatabaseManager;
use Illuminate\Database\Events\QueryExecuted;
use Illuminate\Events\Dispatcher;
use Illuminate\Support\Facades\Cache;
use Monolog\Logger;
use Orkester\Persistence\Criteria\Criteria;
use Orkester\Persistence\Map\ClassMap;
use Phpfastcache\Helper\Psr16Adapter;
use Psr\Log\LoggerInterface;

class PersistenceManager
{
    public static DatabaseManager $capsule;
    /**
     * @var ClassMap[]
     */
//    public static Psr16Adapter $cachedClassMaps;
    public static array $classMaps = [];
    protected static ?\SplObjectStorage $connectionCache = null;
    protected static bool $initialized = false;
    protected static LoggerInterface $logger;
    protected static string $defaultDb;
    protected static string $mappingClassName;

    public function __construct(DatabaseManager $manager, LoggerInterface $logger, string $mappingClassName)
    {
        static::init($manager, $logger, $mappingClassName);
    }

    public static function buildDatabaseManager(DatabaseConfiguration $configuration): DatabaseManager
    {
        $capsule = new Capsule();
        foreach ($configuration->databases as $name => $conf) {
            $capsule->addConnection([
                'driver' => $conf['db'] ?? 'mysql',
                'host' => $conf['host'] ?? 'localhost',
                'database' => $conf['dbname'] ?? 'database',
                'username' => $conf['user'] ?? 'root',
                'password' => $conf['password'] ?? 'password',
                'charset' => $conf['charset'] ?? 'utf8',
                'collation' => $conf['collate'] ?? 'utf8_unicode_ci',
                'prefix' => $conf['prefix'] ?? '',
                'options' => $conf['options'] ?? [],
            ], $name);
        }
        $capsule->setEventDispatcher(new Dispatcher(new LaravelContainer));
        $manager = $capsule->getDatabaseManager();
        $manager->setDefaultConnection($configuration->default);
        static::$connectionCache = new \SplObjectStorage();
        return $manager;
    }

    public static function init(DatabaseManager $manager, LoggerInterface $logger, string $mappingClassName): void
    {
        if (self::$initialized) return;
        static::$initialized = true;
        static::$logger = $logger;
        static::$capsule = $manager;
        //static::$cachedClassMaps = new Psr16Adapter('apcu');
        static::$mappingClassName = $mappingClassName;
    }

    public static function getCriteria(string $databaseName = null, string|Model $model = null): Criteria
    {
        $classMap = static::getClassMap($model);
        return static::getCriteriaForClassMap($classMap, $databaseName);
    }

    public static function getCriteriaForClassMap(ClassMap $classMap, string $databaseName = null)
    {
        $connection = static::getConnection($databaseName);
        $criteria = new Criteria($connection);
        return $criteria->setClassMap($classMap);
    }

    public static function getFileName(string $className): string|false
    {
        if (!class_exists($className)) return false;
        $rc = new \ReflectionClass($className);
        return $rc->getFileName();
    }

    private static function getSignature(string $className): string
    {
        $fileName = static::getFileName($className);
        if ($fileName) {
            $stat = stat($fileName);
            $lastModification = $stat['mtime'];
        }
        return md5($className . ($lastModification ?? ''));
    }

    public static function getClassMap(string|Model $className = null): ClassMap
    {
        $className ??= static::class;
        if (!isset(self::$classMaps[$className])) {
            $key = self::getSignature($className);
            if (Cache::has($key)) {
                self::$classMaps[$className] = Cache::get($key);
            } else {
                self::$classMaps[$className] = new ClassMap($className);
                $repositoryClassName = "\\App\\Repositories\\{$className}";
                $repositoryClassName::map(self::$classMaps[$className]);
                Cache::put($key, self::$classMaps[$className], 300);

            }
            /*
            if (self::$cachedClassMaps->has($key)) {
                self::$classMaps[$className] = self::$cachedClassMaps->get($key);
            } else {
                self::$classMaps[$className] = new ClassMap($className);
                //self::$mappingClassName::map($className, self::$classMaps[$className]);
                $repositoryClassName = "\\App\\Repositories\\{$className}";
                $repositoryClassName::map(self::$classMaps[$className]);
                self::$cachedClassMaps->set($key, self::$classMaps[$className], 300);
            }
            */
        }
        return self::$classMaps[$className];
    }

    public static function registerClassMap(ClassMap $classMap, string $name)
    {
        $key = static::getSignature($name);
        //static::$cachedClassMaps->set($key, $classMap);
        Cache::put($key, $classMap, 300);
        static::$classMaps[$name] = $classMap;
    }

    public static function getConnection(string $databaseName = null): Connection
    {
        $databaseName ??= static::$capsule->getDefaultConnection();

        $connection = static::$capsule->connection($databaseName);
        $connection->enableQueryLog();

        if (static::$connectionCache && !static::$connectionCache->contains($connection)) {
            $connection->listen(function (QueryExecuted $event) use ($connection) {
                $rawSql = $connection->getQueryGrammar()->substituteBindingsIntoRawSql(
                    $event->sql,
                    $event->bindings
                );
                static::$logger->debug($rawSql);
            });

            static::$connectionCache->attach($connection);
        }
        (new \ReflectionClass(get_class($connection)))
            ->getProperty('fetchMode')->setValue($connection, \PDO::FETCH_OBJ);
        return $connection;
    }

    public static function beginTransaction(?string $databaseName = null)
    {
        $connection = static::getConnection($databaseName);
        if ($connection->transactionLevel() == 0) {
            static::$logger->info("BEGIN TRANSACTION");
        }
        $connection->beginTransaction();
    }

    public static function commit(?string $databaseName = null)
    {
        $connection = static::getConnection($databaseName);
        if ($connection->transactionLevel() == 1) {
            static::$logger->info("COMMIT");
        }
        $connection->commit();
    }

    public static function rollback(?string $databaseName = null)
    {
        static::$logger->info("ROLLBACK");
        static::getConnection($databaseName)->rollBack();
    }

    public static function transaction(callable $closure, ?string $databaseName = null): mixed
    {
        $cb = fn(Connection $connection) => $closure($connection);
        return static::getConnection($databaseName)->transaction($cb);
    }
}
