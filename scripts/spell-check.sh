#!/usr/bin/env bash
set -euo pipefail

# Spell-check the resume LaTeX file using aspell
# Ignores LaTeX commands and common technical terms

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
TEX_FILE="${ROOT_DIR}/main.tex"

# Check if aspell is installed
if ! command -v aspell &> /dev/null; then
  echo "Error: aspell is not installed. Install it with: brew install aspell"
  exit 1
fi

# Create a personal dictionary for technical terms
PERSONAL_DICT="${ROOT_DIR}/.aspell-personal"
if [[ ! -f "${PERSONAL_DICT}" ]]; then
  cat > "${PERSONAL_DICT}" << 'EOF'
personal_ws-1.1 en 50 utf-8
AWS
SLURM
Kubernetes
Grafana
Prometheus
DevOps
ETL
AWS
nnU
MRI
EHR
GPU
NVIDIA
RedHat
ReadTheDocs
CircleCI
IDL
MVP
Matlab
EMACS
VSCode
Singularity
Ceph
Globus
Jira
Salesforce
Teams
APIs
Scrum
Agile
SOPs
SOP
causal
GIS
CI
EOF
fi

echo "Running spell check on ${TEX_FILE}..."

# Use aspell in TeX mode and print unique misspellings.
misspellings="$(aspell --mode=tex --personal="${PERSONAL_DICT}" list < "${TEX_FILE}" | sort -u)"

if [[ -z "${misspellings}" ]]; then
  echo "No spelling issues found."
else
  echo "Potential misspellings:"
  echo "${misspellings}"
fi

echo ""
echo "Spell check complete."
echo "To add words to the personal dictionary, edit: ${PERSONAL_DICT}"
