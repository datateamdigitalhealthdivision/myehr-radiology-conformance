#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENDORED_PACKAGE_DIR="${ROOT_DIR}/vendor-packages/hl7.fhir.uv.mycore-1.0.0/package"

if [[ -z "${HOME:-}" ]]; then
  echo "HOME is not set; cannot seed the FHIR package cache." >&2
  exit 1
fi

TARGET_ROOT="${HOME}/.fhir/packages/hl7.fhir.uv.mycore#1.0.0"
TARGET_PACKAGE_DIR="${TARGET_ROOT}/package"

if [[ ! -f "${VENDORED_PACKAGE_DIR}/package.json" ]]; then
  echo "Vendored MY Core package snapshot is missing." >&2
  exit 1
fi

if [[ ! -f "${TARGET_PACKAGE_DIR}/package.json" ]]; then
  mkdir -p "${TARGET_ROOT}"
  rm -rf "${TARGET_PACKAGE_DIR}"
  cp -R "${VENDORED_PACKAGE_DIR}" "${TARGET_PACKAGE_DIR}"
  echo "Seeded MY Core package cache from vendored snapshot."
else
  echo "MY Core package cache already present."
fi

