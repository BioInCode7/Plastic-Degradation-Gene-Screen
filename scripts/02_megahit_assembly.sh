#!/bin/bash
set -euo pipefail

SAMPLE=$1

QC_DIR=data/qc
ASM_DIR=data/assembly/${SAMPLE}_megahit

mkdir -p ${ASM_DIR}

megahit \
  -1 ${QC_DIR}/${SAMPLE}_1.qc.fastq.gz \
  -2 ${QC_DIR}/${SAMPLE}_2.qc.fastq.gz \
  -o ${ASM_DIR} \
  --min-contig-len 500 \
  --num-cpu-threads 30
