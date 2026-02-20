#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="${1:-applications}"
PDF_ENGINE="${PDF_ENGINE:-weasyprint}"
CSS_FILE="${CSS_FILE:-styles/pdf.css}"

if ! command -v pandoc >/dev/null 2>&1; then
  echo "pandoc is required but not installed." >&2
  exit 1
fi

for d in "$ROOT_DIR"/*; do
  [[ -d "$d" ]] || continue

  resume_md="$d/resume-tailored.md"
  cover_md="$d/cover-letter.md"
  resume_pdf="$d/resume-tailored.pdf"
  cover_pdf="$d/cover-letter.pdf"

  if [[ -f "$resume_md" ]]; then
    pandoc "$resume_md" -o "$resume_pdf" --pdf-engine="$PDF_ENGINE" --css="$CSS_FILE"
    echo "Exported: $resume_pdf"
  fi

  if [[ -f "$cover_md" ]]; then
    pandoc "$cover_md" -o "$cover_pdf" --pdf-engine="$PDF_ENGINE" --css="$CSS_FILE"
    echo "Exported: $cover_pdf"
  fi
done
