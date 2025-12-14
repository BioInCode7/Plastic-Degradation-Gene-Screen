# Workflow: Screening of Plastic-Degradation Genes in a Metagenome

This document describes the complete bioinformatics workflow implemented in this repository to screen environmental metagenomes for genes associated with plastic biodegradation.

The workflow follows a targeted, hypothesis-driven strategy rather than full functional annotation.

## Overview of the Workflow

1. Raw read quality control
2. Metagenome assembly
3. Gene prediction
4. Construction of reference databases
5. Targeted similarity search (BLAST)
6. Filtering and summarization of candidate genes

Each step is described below with the tools, inputs, and outputs used.

## 1. Quality Control of Raw Reads

**Input:**
- Paired-end shotgun metagenomic reads (FASTQ)
- Source: NCBI SRA (SRR28167100)

**Tool:**
- `fastp`

**Script:**
- `scripts/01_fastp_qc.sh`

**Purpose:**
- Remove low-quality bases and reads
- Filter adapter contamination
- Generate QC reports

**Outputs:**
- Quality-filtered reads (`*.qc.fastq.gz`)
- HTML and JSON quality reports

**Output directory:**
data/qc/
results/

## 2. Metagenome Assembly

**Input:**
- Quality-controlled paired-end reads

**Tool:**
- `MEGAHIT`

**Script:**
- `scripts/02_megahit_assembly.sh`

**Purpose:**
- Assemble short reads into longer contigs to improve gene prediction and homology detection

**Key output:**
- Final assembled contigs:
data/assembly/SRR28167100_megahit/final.contigs.fa


Intermediate contigs and logs are generated but not tracked in the repository.

## 3. Gene Prediction

**Input:**
- Assembled contigs

**Tool:**
- `Prodigal` (metagenomic mode)

**Script:**
- `scripts/03_prodigal_gene_prediction.sh`

**Purpose:**
- Predict open reading frames (ORFs) from assembled contigs

**Outputs:**
data/genes/
├── SRR28167100_genes.fna
├── SRR28167100_proteins.faa
└── SRR28167100.gff

Protein sequences are used for all downstream analyses.

## 4. Reference Databases

Two complementary reference databases are used for targeted screening.

### 4.1 PlasticDB

**Description:**
- A database of plastic-affiliated and plastic-degrading enzymes compiled from literature and genome annotations.

**Files:**
data/databases/plasticdb/
├── plasticdb_proteins.faa
└── yearly/


A BLAST protein database is generated locally using `makeblastdb`.

### 4.2 PAZy (Plastics-Active Enzymes Database)

**Description:**
- A curated database of biochemically characterized plastic-active enzymes.

**Source:**
- https://pazy.eu

**Curation steps:**
- Manual extraction of enzyme identifiers
- Automated retrieval of protein sequences from UniProt and NCBI
- Removal of duplicate sequences

**Files:**
data/databases/pazy/
├── pazy_proteins.nr.faa
├── pazy_ids.tsv
└── pazy_id2polymer.tsv

## 5. Similarity Search (BLAST)

**Input:**
- Predicted metagenomic proteins

**Tool:**
- `blastp`

**Scripts:**
- `scripts/04a_blastp_plasticdb.sh`
- PAZy BLAST executed directly from command line

**Databases:**
- PlasticDB protein BLAST database
- PAZy protein BLAST database

**Output format:**
- Tabular (`outfmt 6`)

**Output directory:**

results/blast/


## 6. Filtering of Candidate Hits

BLAST results are filtered using thresholds on:

- Percent identity
- Alignment length
- Query coverage

Filtering is performed using `awk` and standard Unix tools.

Filtered hit tables represent candidate genes potentially involved in plastic degradation.

## 7. Result Summarization

Filtered hits are summarized to:

- Count unique candidate genes
- Identify genes detected by both databases
- Associate hits with polymer types (PAZy)

**Output directory:**
results/summary/


These summary files form the basis for downstream interpretation.

### Visualization

Summary figures were generated in R from final result tables
(see `analysis/figures/`).

results/interpretation.md

The distribution of candidates across databases is visualized
in a Venn diagram (Figure 1).


