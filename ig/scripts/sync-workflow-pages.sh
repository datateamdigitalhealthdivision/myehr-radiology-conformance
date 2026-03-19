#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSPACE_ROOT="$(cd "${ROOT_DIR}/.." && pwd)"
cd "${ROOT_DIR}"

WORKFLOW_PAGES=(
  "docs/04-workflows/01-ordering.md:input/pagecontent/workflow-01-ordering.md"
  "docs/04-workflows/02-scheduling.md:input/pagecontent/workflow-02-scheduling.md"
  "docs/04-workflows/03-modality-worklist.md:input/pagecontent/workflow-03-modality-worklist.md"
  "docs/04-workflows/04-acquisition-and-mpps.md:input/pagecontent/workflow-04-acquisition-and-mpps.md"
  "docs/04-workflows/05-storage-and-commitment.md:input/pagecontent/workflow-05-storage-and-commitment.md"
  "docs/04-workflows/06-reporting.md:input/pagecontent/workflow-06-reporting.md"
  "docs/04-workflows/07-viewing-and-retrieval.md:input/pagecontent/workflow-07-viewing-and-retrieval.md"
  "docs/04-workflows/08-cross-enterprise-sharing.md:input/pagecontent/workflow-08-cross-enterprise-sharing.md"
  "docs/04-workflows/09-external-priors.md:input/pagecontent/workflow-09-external-priors.md"
  "docs/04-workflows/10-corrections-iocm.md:input/pagecontent/workflow-10-corrections-iocm.md"
  "docs/04-workflows/11-encounter-based-imaging.md:input/pagecontent/workflow-11-encounter-based-imaging.md"
)

for entry in "${WORKFLOW_PAGES[@]}"; do
  source_file="${entry%%:*}"
  destination_file="${entry##*:}"
  source_url="https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/${source_file}"

  {
    cat "${WORKSPACE_ROOT}/${source_file}"
    printf '\n\n## Related Pages\n\n'
    printf '%s\n' '- [Workflow Summary](workflow-summary.html)'
    printf '%s\n' '- [FHIR Artefacts](fhir-artefacts.html)'
    printf '%s\n' '- [Technical Annexes](annexes.html)'
    printf '%s\n' "- Maintained source markdown: [${source_file}](${source_url})"
  } > "${ROOT_DIR}/${destination_file}"
done
