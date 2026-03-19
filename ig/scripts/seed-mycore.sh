#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE_ROOT="$(cd "${ROOT_DIR}/.." && pwd)"
WORKSPACE_PACKAGE_CACHE="${WORKSPACE_ROOT}/.fhir/packages"
VENDORED_PACKAGE_DIR="${ROOT_DIR}/vendor-packages/hl7.fhir.uv.mycore-1.0.0/package"

if [[ -z "${HOME:-}" ]]; then
  echo "HOME is not set; cannot seed the FHIR package cache." >&2
  exit 1
fi

TARGET_CACHE_ROOT="${HOME}/.fhir/packages"
TARGET_ROOT="${TARGET_CACHE_ROOT}/hl7.fhir.uv.mycore#1.0.0"
TARGET_PACKAGE_DIR="${TARGET_ROOT}/package"

if [[ ! -f "${VENDORED_PACKAGE_DIR}/package.json" ]]; then
  echo "Vendored MY Core package snapshot is missing." >&2
  exit 1
fi

mkdir -p "${TARGET_CACHE_ROOT}"

if [[ -d "${WORKSPACE_PACKAGE_CACHE}" ]]; then
  for package_dir in "${WORKSPACE_PACKAGE_CACHE}"/*; do
    [[ -d "${package_dir}" ]] || continue
    target_dir="${TARGET_CACHE_ROOT}/$(basename "${package_dir}")"
    if [[ ! -d "${target_dir}" ]]; then
      cp -R "${package_dir}" "${target_dir}"
    fi
  done
fi

if [[ ! -f "${TARGET_PACKAGE_DIR}/package.json" ]]; then
  mkdir -p "${TARGET_ROOT}"
  rm -rf "${TARGET_PACKAGE_DIR}"
  cp -R "${VENDORED_PACKAGE_DIR}" "${TARGET_PACKAGE_DIR}"
  echo "Seeded MY Core package cache from vendored snapshot."
else
  echo "MY Core package cache already present."
fi
