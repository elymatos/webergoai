# startup.sh - Container startup script
#!/bin/bash
set -e

echo "🚀 Starting ErgoAI Web Interface Backend..."

# Wait for database to be ready
echo "⏳ Waiting for database..."
while ! nc -z ${DB_HOST:-postgres} ${DB_PORT:-5432}; do
    sleep 1
done
echo "✅ Database is ready"

# Run database migrations
echo "🔄 Running database migrations..."
python migrations_cli.py upgrade

# Start the application
echo "🌟 Starting application server..."
if [ "$FLASK_ENV" = "development" ]; then
    python run.py
else
    gunicorn --bind 0.0.0.0:5000 --workers 4 --timeout 120 --access-logfile - --error-logfile - wsgi:app
fi
