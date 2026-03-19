#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

EXAMPLE_DEST="input/fsh/examples-generated"
VOCAB_DEST="input/fsh/vocab-generated"

mkdir -p "${EXAMPLE_DEST}" "${VOCAB_DEST}"
find "${EXAMPLE_DEST}" -maxdepth 1 -type f -name '*.fsh' -delete 2>/dev/null || true
find "${VOCAB_DEST}" -maxdepth 1 -type f -name '*.fsh' -delete 2>/dev/null || true

shopt -s nullglob
for file in input/examples/*.fsh; do
  cp "${file}" "${EXAMPLE_DEST}/"
done

for file in input/vocab/*.fsh; do
  cp "${file}" "${VOCAB_DEST}/"
done
