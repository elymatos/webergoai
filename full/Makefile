# Makefile
# Updated with correct commands

.PHONY: help build up down logs shell test migrate seed clean

help:
	@echo "Available commands:"
	@echo "  build        - Build all containers"
	@echo "  up           - Start all services (production)"
	@echo "  dev          - Start development environment"
	@echo "  down         - Stop all services"
	@echo "  logs         - View logs"
	@echo "  logs-worker  - View worker logs specifically"
	@echo "  shell        - Access backend shell"
	@echo "  worker-shell - Access worker shell"
	@echo "  test         - Run tests"
	@echo "  migrate      - Run database migrations"
	@echo "  seed         - Seed database with sample data"
	@echo "  clean        - Clean up containers and volumes"
	@echo "  monitor      - Monitor Celery workers"

build:
	docker-compose build

up:
	docker-compose up -d

dev:
	docker-compose -f docker-compose.dev.yml up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

logs-worker:
	docker-compose logs -f worker

shell:
	docker-compose exec backend /bin/bash

worker-shell:
	docker-compose exec worker /bin/bash

test:
	docker-compose exec backend python -m pytest

migrate:
	docker-compose exec backend python migrations_cli.py upgrade

seed:
	docker-compose exec backend python seed_database.py

monitor:
	docker-compose exec backend python worker_monitor.py monitor

clean:
	docker-compose down -v --remove-orphans
	docker system prune -f

# Worker management
worker-status:
	docker-compose exec backend python worker_monitor.py status

worker-inspect:
	docker-compose exec backend python worker_monitor.py inspect

worker-purge:
	docker-compose exec backend python worker_monitor.py purge

# Database management
backup-db:
	docker-compose exec postgres pg_dump -U ergoai_user ergoai_db > backup_$(shell date +%Y%m%d_%H%M%S).sql

restore-db:
	@read -p "Enter backup file path: " file; \
	docker-compose exec -T postgres psql -U ergoai_user ergoai_db < $$file

# Development helpers
dev-logs:
	docker-compose -f docker-compose.dev.yml logs -f

dev-down:
	docker-compose -f docker-compose.dev.yml down

dev-clean:
	docker-compose -f docker-compose.dev.yml down -v --remove-orphans
