# celery_app.py - Celery application configuration
import os
from celery import Celery
from kombu import Queue

def make_celery():
    """Create and configure Celery app"""
    celery = Celery(
        'ergoai_worker',
        broker=os.getenv('REDIS_URL', 'redis://localhost:6379/0'),
        backend=os.getenv('REDIS_URL', 'redis://localhost:6379/0'),
        include=['tasks']
    )

    # Configuration
    celery.conf.update(
        # Task settings
        task_serializer='json',
        accept_content=['json'],
        result_serializer='json',
        timezone='UTC',
        enable_utc=True,

        # Worker settings
        worker_prefetch_multiplier=1,
        task_acks_late=True,
        worker_max_tasks_per_child=1000,

        # Queue settings
        task_default_queue='ergoai_tasks',
        task_routes={
            'tasks.execute_query_async': {'queue': 'query_processing'},
            'tasks.validate_syntax_async': {'queue': 'validation'},
            'tasks.generate_explanation_async': {'queue': 'explanation'},
        },

        # Queue definitions
        task_queues=(
            Queue('ergoai_tasks'),
            Queue('query_processing'),
            Queue('validation'),
            Queue('explanation'),
        ),

        # Result settings
        result_expires=3600,  # 1 hour
        result_backend_transport_options={
            'master_name': 'mymaster',
            'visibility_timeout': 3600,
        },

        # Monitoring
        worker_send_task_events=True,
        task_send_sent_event=True,
    )

    return celery

# Create Celery instance
celery_app = make_celery()

if __name__ == '__main__':
    celery_app.start()
