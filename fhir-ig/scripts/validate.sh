#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE_ROOT="$(cd "${ROOT_DIR}/.." && pwd)"
cd "${ROOT_DIR}"

export HOME="${WORKSPACE_ROOT}"
export USERPROFILE="${WORKSPACE_ROOT}"

if ! command -v sushi >/dev/null 2>&1; then
  echo "fsh-sushi is required but was not found on PATH." >&2
  exit 1
fi

./scripts/seed-mycore.sh

echo "Validating FSH syntax with SUSHI..."
sushi .

if [[ ! -d "fsh-generated/resources" ]]; then
  echo "Expected generated resources were not created." >&2
  exit 1
fi

echo "SUSHI validation completed."
