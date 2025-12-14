#!/bin/bash
set -euo pipefail

SAMPLE=$1

QUERY=data/genes/${SAMPLE}_proteins.faa
DB=data/databases/pazy/pazy_db
OUT=results/blast/${SAMPLE}_vs_PAZy.tsv

blastp \
  -query "${QUERY}" \
  -db "${DB}" \
  -out "${OUT}" \
  -outfmt 6 \
  -evalue 1e-5 \
  -num_threads 30
