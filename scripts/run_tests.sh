#!/usr/bin/env bash
set -euo pipefail

DB_NAME="${1:-retailpulse}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for file in "${ROOT_DIR}"/sql/tests/*.sql; do
    echo
    echo "============================================================"
    echo "Running ${file#$ROOT_DIR/}"
    echo "============================================================"
    psql -v ON_ERROR_STOP=1 -d "${DB_NAME}" -f "${file}"
done

echo
echo "All RetailPulse test scripts completed."
