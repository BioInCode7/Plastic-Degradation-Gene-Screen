# Methods

## Overview

This repository implements a targeted, question-driven bioinformatics workflow to screen environmental metagenomes for genetic potential related to plastic biodegradation.

Rather than performing full functional annotation, the workflow focuses on the detection of sequence similarity to curated sets of plastic-degrading enzymes, using explicit evidence levels and transparent filtering criteria.

All analyses were performed on a single environmental shotgun metagenome as a proof of concept, with the workflow designed to be easily extended to additional datasets.

---

## Input data

The input dataset consists of paired-end shotgun metagenomic reads obtained from the NCBI Sequence Read Archive (SRA).

- BioProject: PRJNA972844 
- Example run: SRR28167100 
- Sample type: environmental sediment metagenome 

Raw sequencing data were downloaded locally but are not tracked in the repository due to size constraints and reproducibility considerations.

---

## Quality control

Raw reads were processed using `fastp` to remove low-quality bases and adapter contamination.

Default parameters were used, with quality-controlled reads retained for downstream assembly.
Quality control reports (HTML and JSON) are included in the `results/` directory.

---

## Metagenome assembly

Quality-controlled reads were assembled de novo using `MEGAHIT`.

The final assembly (`final.contigs.fa`) was used for all downstream analyses.
Intermediate assembly files were generated but are excluded from version control.

---

## Gene prediction

Protein-coding genes were predicted from assembled contigs using `Prodigal` in metagenomic mode.

This step produced:
- nucleotide gene sequences
- predicted protein sequences
- GFF annotations

Downstream analyses were performed using the predicted protein sequences.

---

## Reference databases

Two complementary reference databases were used to screen for plastic-degradation-related genes:

### PlasticDB

PlasticDB is a literature-curated database of microorganisms and proteins reported to be associated with plastic biodegradation, including both characterized and putative enzymes.

Protein sequences were downloaded from PlasticDB, merged across release years, deduplicated, and formatted as a local BLAST protein database.

This database provides broad coverage and sensitivity.

### PAZy

PAZy (Plastics-Active Enzymes Database) contains only enzymes with experimental, biochemical evidence of activity on plastic polymers.

Protein identifiers listed in PAZy were used to retrieve corresponding protein sequences from public repositories (e.g. UniProt and NCBI), followed by deduplication and BLAST database construction.

This database provides high-specificity, conservative evidence.

---

## Targeted sequence similarity search

Predicted proteins from the metagenome were compared against both reference databases using `BLASTp`.

Searches were performed locally using protein–protein comparisons.

Separate BLAST runs were executed for PlasticDB and PAZy.

---

## Filtering criteria

To reduce spurious matches, BLAST hits were filtered using explicit thresholds:

- minimum percent identity
- minimum alignment length
- minimum query coverage
- E-value threshold

Filtering parameters were chosen to balance sensitivity and specificity and are documented in the analysis scripts.

Only filtered hits were used for downstream summarization.

---

## Result summarization

Filtered BLAST results were summarized to:

- identify genes matching PlasticDB and/or PAZy entries
- quantify overlap between databases
- classify detected genes by associated polymer type (when available)

Summary tables are provided in the `results/summary/` directory.

---

## Reproducibility notes

This repository includes:
- all scripts required to reproduce the analysis
- reference database construction steps
- environment specification (`environment.yml`)

Large raw datasets and intermediate files are excluded from version control but can be regenerated following the documented workflow.

