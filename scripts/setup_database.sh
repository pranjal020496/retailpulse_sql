#!/usr/bin/env bash
set -euo pipefail

DB_NAME="${1:-retailpulse}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! psql -d postgres -Atqc "SELECT 1;" >/dev/null 2>&1; then
    echo "Error: could not connect to PostgreSQL."
    echo "Start PostgreSQL and verify that psql can connect."
    exit 1
fi

if ! psql -d postgres -Atqc \
    "SELECT 1 FROM pg_database WHERE datname = '${DB_NAME}';" \
    | grep -q 1; then
    echo "Creating database: ${DB_NAME}"
    createdb "${DB_NAME}"
else
    echo "Database already exists: ${DB_NAME}"
fi

run_sql_file() {
    local file="$1"
    echo
    echo "Running ${file#$ROOT_DIR/}"
    psql -v ON_ERROR_STOP=1 -d "${DB_NAME}" -f "${file}"
}

for file in "${ROOT_DIR}"/sql/ddl/*.sql; do
    run_sql_file "${file}"
done

for file in "${ROOT_DIR}"/sql/seed/*.sql; do
    run_sql_file "${file}"
done

echo
echo "RetailPulse setup completed successfully."
