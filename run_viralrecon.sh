#!/usr/bin/env bash
set -euo pipefail

# Run from the repository root.
# Ensure Docker Desktop is running and samplesheet.csv is present.
# Review the options against the nf-core/viralrecon v2.6.0 documentation.

nextflow run nf-core/viralrecon \
  -r 2.6.0 \
  -profile docker \
  --max_memory '12.GB' \
  --max_cpus 4 \
  --input samplesheet.csv \
  --outdir results/viralrecon \
  --protocol amplicon \
  --genome 'MN908947.3' \
  --primer_set artic \
  --primer_set_version 3 \
  --skip_kraken2 \
  --skip_assembly \
  --skip_pangolin \
  --skip_nextclade \
  --skip_asciigenome \
  --platform illumina \
  -resume
