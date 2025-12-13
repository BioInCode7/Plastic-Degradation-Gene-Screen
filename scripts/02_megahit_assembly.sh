#!/usr/bin/env bash

# Metagenomic assembly using MEGAHIT

set -euo pipefail

QC_DIR="data/qc"
ASM_DIR="data/assembly"

SAMPLE="SRR28167100"

megahit \
  -1 ${QC_DIR}/${SAMPLE}_1.qc.fastq.gz \
  -2 ${QC_DIR}/${SAMPLE}_2.qc.fastq.gz \
  --presets meta-sensitive \
  --min-contig-len 1000 \
  -t 30 \
  --out-dir ${ASM_DIR}/${SAMPLE}_megahit
