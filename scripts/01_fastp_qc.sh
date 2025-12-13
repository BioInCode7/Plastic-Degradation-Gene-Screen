#!/usr/bin/env bash

# Quality control of paired-end metagenomic reads using fastp
#THREADS=4 increase on larger machines

set -euo pipefail

RAW_DIR="data/raw"
QC_DIR="data/qc"
RESULTS_DIR="results"

SAMPLE="SRR28167100"

fastp \
  -i ${RAW_DIR}/${SAMPLE}_1.fastq.gz \
  -I ${RAW_DIR}/${SAMPLE}_2.fastq.gz \
  -o ${QC_DIR}/${SAMPLE}_1.qc.fastq.gz \
  -O ${QC_DIR}/${SAMPLE}_2.qc.fastq.gz \
  --detect_adapter_for_pe \
  --cut_front \
  --cut_tail \
  --qualified_quality_phred 20 \
  --length_required 50 \
  --thread 4 \
  --html ${RESULTS_DIR}/${SAMPLE}_fastp.html \
  --json ${RESULTS_DIR}/${SAMPLE}_fastp.json
