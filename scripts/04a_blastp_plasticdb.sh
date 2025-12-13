#!/usr/bin/env bash
# BLASTp screening against PlasticDB

set -euo pipefail

QUERY="data/genes/SRR28167100_proteins.faa"
DB="data/databases/plasticdb/plasticdb_db"
OUT="results/blast/SRR28167100_vs_PlasticDB.tsv"

mkdir -p results/blast

blastp \
  -query ${QUERY} \
  -db ${DB} \
  -out ${OUT} \
  -evalue 1e-5 \
  -max_target_seqs 1 \
  -outfmt "6 qseqid sseqid pident length qlen slen evalue bitscore" \
  -num_threads 4
