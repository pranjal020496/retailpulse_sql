DB_NAME ?= retailpulse

.PHONY: setup analytics test reset

setup:
	./scripts/setup_database.sh $(DB_NAME)

analytics:
	./scripts/run_analytics.sh $(DB_NAME)

test:
	./scripts/run_tests.sh $(DB_NAME)

reset:
	./scripts/reset_database.sh $(DB_NAME)
