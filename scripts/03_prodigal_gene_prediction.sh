#!/usr/bin/env bash
# Gene prediction on metagenomic contigs using Prodigal

set -euo pipefail

ASM_DIR="data/assembly/SRR28167100_megahit"
GENE_DIR="data/genes"
SAMPLE="SRR28167100"

mkdir -p ${GENE_DIR}

prodigal \
  -i ${ASM_DIR}/final.contigs.fa \
  -a ${GENE_DIR}/${SAMPLE}_proteins.faa \
  -d ${GENE_DIR}/${SAMPLE}_genes.fna \
  -f gff \
  -o ${GENE_DIR}/${SAMPLE}.gff \
  -p meta
