# tasks.py - Celery tasks for ErgoAI operations
import os
import tempfile
import subprocess
import uuid
import logging
from pathlib import Path
from datetime import datetime
from celery import current_task
from celery_app import celery_app

logger = logging.getLogger(__name__)

class ErgoAITaskEngine:
    """ErgoAI engine for background tasks"""

    def __init__(self):
        self.ergoai_path = Path(os.getenv('ERGOAI_PATH', '/opt/ergoai'))
        self.temp_dir = Path(tempfile.gettempdir()) / "ergoai_worker"
        self.temp_dir.mkdir(exist_ok=True)

    def execute_query(self, query, knowledge_base_files=None, timeout=30):
        """Execute ErgoAI query in background"""
        try:
            session_id = str(uuid.uuid4())
            session_dir = self.temp_dir / session_id
            session_dir.mkdir(exist_ok=True)

            # Update task progress
            if current_task:
                current_task.update_state(
                    state='PROGRESS',
                    meta={'stage': 'preparing', 'progress': 10}
                )

            # Write knowledge base files
            if knowledge_base_files:
                for filename, content in knowledge_base_files.items():
                    file_path = session_dir / filename
                    file_path.write_text(content)

            if current_task:
                current_task.update_state(
                    state='PROGRESS',
                    meta={'stage': 'executing', 'progress': 50}
                )

            # Create and execute query
            query_file = session_dir / "query.ergo"
            query_file.write_text(query)

            result = self._run_ergoai(session_dir, query_file, timeout)

            if current_task:
                current_task.update_state(
                    state='PROGRESS',
                    meta={'stage': 'completing', 'progress': 90}
                )

            # Cleanup
            self._cleanup_session(session_dir)

            return result

        except Exception as e:
            logger.error(f"Query execution failed: {str(e)}")
            if current_task:
                current_task.update_state(
                    state='FAILURE',
                    meta={'error': str(e)}
                )
            raise

    def _run_ergoai(self, session_dir, query_file, timeout):
        """Run ErgoAI command line interface"""
        cmd = [
            str(self.ergoai_path / "runErgoAI.sh"),
            "--batch",
            "--file", str(query_file)
        ]

        start_time = datetime.now()

        try:
            process = subprocess.run(
                cmd,
                cwd=session_dir,
                capture_output=True,
                text=True,
                timeout=timeout
            )

            execution_time = (datetime.now() - start_time).total_seconds()

            if process.returncode == 0:
                return {
                    'status': 'success',
                    'result': process.stdout,
                    'execution_time': execution_time
                }
            else:
                return {
                    'status': 'error',
                    'message': process.stderr,
                    'execution_time': execution_time
                }

        except subprocess.TimeoutExpired:
            return {
                'status': 'timeout',
                'message': f'Query execution timed out after {timeout} seconds',
                'execution_time': timeout
            }

    def _cleanup_session(self, session_dir):
        """Clean up temporary session files"""
        try:
            import shutil
            shutil.rmtree(session_dir)
        except Exception as e:
            logger.warning(f"Failed to cleanup session {session_dir}: {str(e)}")

# Initialize engine
ergo_engine = ErgoAITaskEngine()

@celery_app.task(bind=True, name='tasks.execute_query_async')
def execute_query_async(self, query, knowledge_base_files=None, timeout=30):
    """Execute ErgoAI query asynchronously"""
    try:
        logger.info(f"Starting async query execution: {query[:100]}...")
        result = ergo_engine.execute_query(query, knowledge_base_files, timeout)
        logger.info(f"Query execution completed with status: {result['status']}")
        return result
    except Exception as e:
        logger.error(f"Async query execution failed: {str(e)}")
        raise

@celery_app.task(bind=True, name='tasks.validate_syntax_async')
def validate_syntax_async(self, content, file_type='ergo'):
    """Validate ErgoAI syntax asynchronously"""
    try:
        logger.info(f"Starting async syntax validation for {file_type} file")

        self.update_state(
            state='PROGRESS',
            meta={'stage': 'validating', 'progress': 50}
        )

        temp_file = ergo_engine.temp_dir / f"syntax_check_{uuid.uuid4()}.{file_type}"
        temp_file.write_text(content)

        cmd = [
            str(ergo_engine.ergoai_path / "runErgoAI.sh"),
            "--syntax-check",
            str(temp_file)
        ]

        process = subprocess.run(cmd, capture_output=True, text=True, timeout=10)
        temp_file.unlink()

        result = {
            'valid': process.returncode == 0,
            'errors': process.stderr if process.returncode != 0 else None
        }

        logger.info(f"Syntax validation completed: {'valid' if result['valid'] else 'invalid'}")
        return result

    except Exception as e:
        logger.error(f"Async syntax validation failed: {str(e)}")
        raise

@celery_app.task(bind=True, name='tasks.generate_explanation_async')
def generate_explanation_async(self, query, knowledge_base_files=None):
    """Generate query explanation asynchronously"""
    try:
        logger.info(f"Starting async explanation generation for query: {query[:100]}...")

        # Add explanation directive to query
        explain_query = f"why{{{query}}}."

        result = ergo_engine.execute_query(explain_query, knowledge_base_files, timeout=60)

        logger.info(f"Explanation generation completed with status: {result['status']}")
        return result

    except Exception as e:
        logger.error(f"Async explanation generation failed: {str(e)}")
        raise

@celery_app.task(name='tasks.cleanup_temp_files')
def cleanup_temp_files():
    """Periodic task to clean up temporary files"""
    try:
        import shutil
        import time

        temp_dir = ergo_engine.temp_dir
        cutoff_time = time.time() - 3600  # 1 hour ago

        cleaned_count = 0
        for item in temp_dir.iterdir():
            if item.is_dir() and item.stat().st_mtime < cutoff_time:
                shutil.rmtree(item)
                cleaned_count += 1

        logger.info(f"Cleaned up {cleaned_count} temporary directories")
        return {'cleaned_count': cleaned_count}

    except Exception as e:
        logger.error(f"Temp file cleanup failed: {str(e)}")
        raise

@celery_app.task(name='tasks.health_check')
def health_check():
    """Worker health check task"""
    try:
        # Test ErgoAI availability
        test_query = "?- 1+1."
        result = ergo_engine.execute_query(test_query, timeout=10)

        return {
            'status': 'healthy',
            'ergoai_available': result['status'] == 'success',
            'timestamp': datetime.utcnow().isoformat()
        }

    except Exception as e:
        logger.error(f"Health check failed: {str(e)}")
        return {
            'status': 'unhealthy',
            'error': str(e),
            'timestamp': datetime.utcnow().isoformat()
        }
