# CV Repository

This repository contains the LaTeX source and generated PDF for Audrey Houghton's curriculum vitae (CV).

## Files

- `main.tex`: CV source
- `AudreyHoughton_MMDDYYYY.pdf`: Generated CV PDF (date-stamped)

## CV Sections

The CV is organized into the standard sections for a professional academic/industry profile, including:

- Contact information
- Summary or profile
- Education
- Experience
- Skills
- Projects
- Publications, awards, or additional relevant accomplishments

## Build

Build the PDF directly:

```bash
latexmk -pdf -interaction=nonstopmode main.tex
```

The repository's `.latexmkrc` automatically:

- Writes output as `AudreyHoughton_MMDDYYYY.pdf`
- Deletes older `AudreyHoughton_*.pdf` files after a successful build

## Spell Check

Run the repository spell check before finalizing the CV:

```bash
bash spell-check.sh
```
