# worker_monitor.py - Worker monitoring script
#!/usr/bin/env python3
"""
Celery worker monitoring and management script
"""
import os
import sys
import time
from celery_app import celery_app

def inspect_workers():
    """Inspect active workers"""
    inspect = celery_app.control.inspect()

    print("🔍 Active Workers:")
    stats = inspect.stats()
    if stats:
        for worker, data in stats.items():
            print(f"  📊 {worker}: {data.get('pool', {}).get('processes', 'N/A')} processes")
    else:
        print("  ❌ No active workers found")

    print("\n📋 Active Tasks:")
    active = inspect.active()
    if active:
        for worker, tasks in active.items():
            print(f"  🔧 {worker}: {len(tasks)} active tasks")
            for task in tasks:
                print(f"    ⚡ {task['name']} ({task['id'][:8]}...)")
    else:
        print("  ✅ No active tasks")

def worker_status():
    """Check worker status"""
    inspect = celery_app.control.inspect()

    # Ping workers
    pong = inspect.ping()
    if pong:
        print("✅ Workers responding:")
        for worker in pong.keys():
            print(f"  📡 {worker}")
    else:
        print("❌ No workers responding")

    return bool(pong)

def main():
    """Main monitoring function"""
    if len(sys.argv) > 1:
        command = sys.argv[1]

        if command == 'status':
            worker_status()
        elif command == 'inspect':
            inspect_workers()
        elif command == 'purge':
            print("🧹 Purging all tasks...")
            celery_app.control.purge()
            print("✅ All tasks purged")
        elif command == 'monitor':
            print("📊 Starting continuous monitoring (Ctrl+C to stop)...")
            try:
                while True:
                    os.system('clear' if os.name == 'posix' else 'cls')
                    print("ErgoAI Worker Monitor")
                    print("=" * 50)
                    worker_status()
                    print()
                    inspect_workers()
                    print(f"\n🕐 Last updated: {time.strftime('%Y-%m-%d %H:%M:%S')}")
                    time.sleep(10)
            except KeyboardInterrupt:
                print("\n👋 Monitoring stopped")
        else:
            print(f"Unknown command: {command}")
            print("Available commands: status, inspect, purge, monitor")
    else:
        print("ErgoAI Worker Monitor")
        print("Usage: python worker_monitor.py [status|inspect|purge|monitor]")

if __name__ == '__main__':
    main()
