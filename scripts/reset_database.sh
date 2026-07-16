#!/usr/bin/env bash
set -euo pipefail

DB_NAME="${1:-retailpulse}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "This will DROP the complete retail schema in database: ${DB_NAME}"
read -r -p "Type RESET to continue: " confirmation

if [[ "${confirmation}" != "RESET" ]]; then
    echo "Reset cancelled."
    exit 0
fi

psql -v ON_ERROR_STOP=1 \
    -d "${DB_NAME}" \
    -c "DROP SCHEMA IF EXISTS retail CASCADE;"

"${ROOT_DIR}/scripts/setup_database.sh" "${DB_NAME}"
