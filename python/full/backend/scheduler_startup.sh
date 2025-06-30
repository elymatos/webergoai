# scheduler_startup.sh - Scheduler startup script
#!/bin/bash
set -e

echo "📅 Starting ErgoAI Celery Beat Scheduler..."

# Wait for Redis to be ready
echo "⏳ Waiting for Redis..."
while ! nc -z ${REDIS_HOST:-redis} ${REDIS_PORT:-6379}; do
    sleep 1
done
echo "✅ Redis is ready"

# Wait for database to be ready
echo "⏳ Waiting for database..."
while ! nc -z ${DB_HOST:-postgres} ${DB_PORT:-5432}; do
    sleep 1
done
echo "✅ Database is ready"

# Wait for worker to be ready (optional)
echo "⏳ Waiting a bit for worker to initialize..."
sleep 30

# Start Celery Beat scheduler
echo "📅 Starting Celery Beat scheduler..."
exec celery -A celery_app beat --loglevel=info
