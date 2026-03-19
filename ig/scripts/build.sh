#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE_ROOT="$(cd "${ROOT_DIR}/.." && pwd)"
cd "${ROOT_DIR}"

export HOME="${WORKSPACE_ROOT}"
export USERPROFILE="${WORKSPACE_ROOT}"

if [[ -x "./node_modules/.bin/sushi" ]]; then
  SUSHI_CMD="./node_modules/.bin/sushi"
elif command -v sushi >/dev/null 2>&1; then
  SUSHI_CMD="$(command -v sushi)"
else
  echo "fsh-sushi is required but was not found on PATH." >&2
  exit 1
fi

./scripts/sync-fsh-inputs.sh
./scripts/seed-mycore.sh

echo "Running SUSHI..."
"${SUSHI_CMD}" .

mkdir -p input-cache
PUBLISHER_JAR="input-cache/publisher.jar"

if [[ ! -f "${PUBLISHER_JAR}" ]]; then
  echo "Downloading HL7 IG Publisher..."
  curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o "${PUBLISHER_JAR}"
fi

if ! command -v jekyll >/dev/null 2>&1; then
  echo "Jekyll is required to render the HTML guide. Install Ruby plus the jekyll gem locally, or use the GitHub Actions workflows." >&2
  exit 1
fi

PUBLISHER_HOME="$(mktemp -d "${ROOT_DIR}/input-cache/publisher-home-XXXXXX")"
HOME="${PUBLISHER_HOME}" USERPROFILE="${PUBLISHER_HOME}" ./scripts/seed-mycore.sh

echo "Building implementation guide..."
HOME="${PUBLISHER_HOME}" USERPROFILE="${PUBLISHER_HOME}" \
  java -Duser.home="${PUBLISHER_HOME}" -Xmx4g -jar "${PUBLISHER_JAR}" -no-sushi -ig ig.ini
