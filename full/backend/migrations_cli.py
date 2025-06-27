# migrations_cli.py - Database migration helper
#!/usr/bin/env python3
"""
Database migration helper script
Usage: python migrations_cli.py [init|migrate|upgrade|downgrade]
"""
import sys
from flask_migrate import init, migrate, upgrade, downgrade
from app import app, db

def run_migration_command():
    if len(sys.argv) < 2:
        print("Usage: python migrations_cli.py [init|migrate|upgrade|downgrade]")
        sys.exit(1)

    command = sys.argv[1]

    with app.app_context():
        if command == 'init':
            init()
            print("Migration repository initialized")
        elif command == 'migrate':
            message = sys.argv[2] if len(sys.argv) > 2 else "Auto migration"
            migrate(message=message)
            print(f"Migration created: {message}")
        elif command == 'upgrade':
            upgrade()
            print("Database upgraded")
        elif command == 'downgrade':
            downgrade()
            print("Database downgraded")
        else:
            print(f"Unknown command: {command}")
            sys.exit(1)

if __name__ == '__main__':
    run_migration_command()
