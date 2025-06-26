# worker_startup.sh - Worker startup script
#!/bin/bash
set -e

echo "🔧 Starting ErgoAI Celery Worker..."

# Wait for Redis to be ready
echo "⏳ Waiting for Redis..."
while ! nc -z ${REDIS_HOST:-redis} ${REDIS_PORT:-6379}; do
    sleep 1
done
echo "✅ Redis is ready"

# Wait for database to be ready (optional, for logging)
echo "⏳ Waiting for database..."
while ! nc -z ${DB_HOST:-postgres} ${DB_PORT:-5432}; do
    sleep 1
done
echo "✅ Database is ready"

# Create temp directory
mkdir -p /tmp/ergoai_worker

# Start Celery worker with proper syntax
echo "🚀 Starting Celery worker..."
exec celery -A celery_app worker \
    --loglevel=info \
    --concurrency=2 \
    --max-tasks-per-child=1000 \
    --queues=ergoai_tasks,query_processing,validation,explanation
