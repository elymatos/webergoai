# celery_beat.py - Periodic task scheduler
from celery.schedules import crontab
from celery_app import celery_app

# Configure periodic tasks
celery_app.conf.beat_schedule = {
    # Clean up temporary files every hour
    'cleanup-temp-files': {
        'task': 'tasks.cleanup_temp_files',
        'schedule': crontab(minute=0),  # Every hour
    },
    # Health check every 5 minutes
    'worker-health-check': {
        'task': 'tasks.health_check',
        'schedule': crontab(minute='*/5'),  # Every 5 minutes
    },
}

celery_app.conf.timezone = 'UTC'

if __name__ == '__main__':
    celery_app.start()
