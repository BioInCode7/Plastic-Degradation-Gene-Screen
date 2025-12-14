# Plastic-Degradation-Gene-Screen

### Abstract

Plastic pollution represents a growing environmental challenge, and microbial biodegradation has emerged as a potential natural mitigation process. However, assessing the genetic potential for plastic degradation in complex environmental microbiomes remains difficult due to incomplete functional annotation and the risk of overinterpreting weak sequence similarity.

Here, we present a targeted, hypothesis-driven bioinformatics workflow to screen environmental metagenomes for plastic-degradation-related genes using explicit evidence tiers. The pipeline combines two complementary reference databases: PlasticDB, which provides broad literature-curated associations, and PAZy, which includes only biochemically validated plastic-active enzymes.

We applied this workflow to three contrasting metagenomic datasets: a plastic-enriched cow-dung microbial consortium, a natural wetland sediment, and an oligotrophic marine water sample. While PAZy-supported genes were detected at comparable levels across enriched and non-enriched environments, high-confidence PlasticDB hits showed strong enrichment in the plastic-exposed system. The largest ecological divergence was observed within a grey-zone category of lower-similarity PlasticDB candidates, suggesting that microbial adaptation to plastics is primarily reflected in the expansion of putative or uncharacterized functions rather than known enzymes. No detectable plastic-degradation gene potential was observed in the oligotrophic marine dataset, serving as a conservative negative control.

These results highlight the importance of separating confidence levels when screening for plastic-degradation genes and demonstrate that enriched environments concentrate a large, unexplored reservoir of potential plastic-associated functions. The presented workflow provides a transparent and reproducible framework for comparative screening of plastic-degradation gene potential across ecosystems.


## Overview

Plastic pollution is a major environmental problem, and microbial biodegradation is considered a promising natural mitigation strategy.  
This project explores whether **environmental metagenomes contain genetic potential for plastic degradation**, focusing on known and putative plastic-degrading enzymes.

Rather than performing full functional annotation, this repository implements a **targeted, question-driven screening workflow** designed to be transparent, reproducible, and easily extensible.

---

## Biological question and scope

**Can we detect genetic potential for plastic biodegradation in environmental metagenomes using a simple, reproducible bioinformatics workflow?**

The focus is on complex environmental microbiomes (soil, sediment, wastewater, marine systems), where plastic-degrading enzymes may be present at low abundance and are often missed by broad annotation pipelines.

---

## What this repository does

- Implements a targeted, hypothesis-driven screening of metagenomic data for plastic-degradation-related genes
- Uses **two complementary reference databases**:
  - **PlasticDB** (broad, literature-curated associations)
  - **PAZy** (strict, biochemically validated plastic-active enzymes)
- Applies explicit and transparent sequence-similarity filters
- Separates candidates into **high-confidence** and **grey-zone** categories
- Produces interpretable summary tables and figures suitable for downstream analysis
- Emphasizes reproducibility and interpretability over scale

---

## What this repository does NOT do

- It does not claim functional plastic degradation activity
- It does not perform full genome or metagenome annotation
- It does not quantify in situ enzymatic activity or expression
- It does not attempt taxonomic binning or MAG reconstruction
- It does not overinterpret sequence similarity as proof of biodegradation

All results should be interpreted strictly as **genetic potential**, not demonstrated function.

---

## Why this approach is useful

Plastic biodegradation research faces two opposite risks:

- overly permissive claims based on weak sequence similarity
- overly restrictive analyses that miss emerging or uncharacterized enzymes

By combining PlasticDB and PAZy, this repository explicitly separates:

- **putative genetic potential** (PlasticDB)
- **high-confidence enzymatic evidence** (PAZy)

This dual-evidence strategy enables transparent interpretation, cautious prioritization of candidate genes, and reproducible comparisons across environments.

---

## Repository documentation

This repository is organized as a **reproducible bioinformatics report**, rather than a finished publication.

Detailed documentation is provided in the following files:

- 📊 **Workflow overview**: `docs/workflow.md`  
- 🧪 **Methods (technical report)**: `docs/methods.md`  
- 🧠 **Result interpretation**: `results/interpretation.md`

These documents describe exactly what was done, why specific choices were made, and how the analysis can be reproduced or extended.

---
## Data

This project uses publicly available shotgun metagenomic datasets from NCBI/ENA.

### Primary dataset (proof-of-concept)

- **BioProject:** PRJNA1081682  
- **Run:** SRR28167100  
- **Environment:** Cow-dung-derived microbial consortium enriched for PET, PE and PS degradation  
- **Sequencing platform:** DNBSEQ-G400 (PE150)  
- **Rationale:** This dataset represents an environment with expected plastic-degradation potential and was used to establish and validate the workflow.

### Replication datasets (environmental contrast)

To assess robustness and ecological specificity, the pipeline is being replicated on environmental sediment metagenomes with no known plastic enrichment.

## Project status

✅ **Phase 1 complete**  
Core pipeline implemented, documented, and validated on one environmental metagenome.  
Current results are exploratory and intended to support comparative analyses.

Next step: replication of the workflow across additional metagenomes.

---

Environmental contrast: enriched vs non-enriched systems

To evaluate whether plastic exposure shapes the genetic potential for plastic biodegradation, the workflow was applied to two contrasting metagenomic datasets:

a plastic-enriched cow dung microbial consortium (SRR28167100), used as a proof-of-concept system

a natural wetland sediment metagenome with no known plastic enrichment (SRR24575585), used as an environmental replication

PAZy: stable signal of biochemically validated enzymes

The number of PAZy hits was comparable between environments (75 vs 53 genes).
This suggests that enzymes with experimentally validated plastic-degrading activity are broadly distributed across environmental microbiomes, even in systems without explicit plastic enrichment.

This observation supports the idea that known plastic-active enzymes may represent a small, conserved subset of a much larger functional space.

PlasticDB high-confidence: clear enrichment effect

In contrast, high-confidence PlasticDB hits (≥35% identity, ≥60% query coverage) showed a strong enrichment in the plastic-exposed system (591 vs 90 genes).

This indicates that plastic enrichment substantially increases the abundance of genes related to polymer degradation, even when restricting analysis to relatively stringent similarity thresholds.

Grey-zone candidates: primary source of ecological divergence

The largest difference between environments was observed in the PlasticDB grey-zone category, which captures lower-similarity but potentially informative candidates (3410 vs 702 genes).

These results suggest that microbial adaptation to plastics is primarily reflected in the expansion of putative or uncharacterized enzymatic functions, rather than in the proliferation of already known plastic-degrading enzymes.

Taken together, these findings highlight the importance of separating high-confidence enzymatic evidence from emerging functional potential, and justify the use of a dual-database strategy when screening metagenomes for plastic degradation genes.

## Author

**Jesús Salinas**  
Postdoctoral Researcher, Microbiology, University of Almería

## Usage

This pipeline is sample-aware. Each script expects a sample identifier
(e.g. an SRA run accession such as `SRR24575585`) as its first argument.

Example workflow for a single sample:

```bash
bash scripts/01_fastp_qc.sh SRR24575585
bash scripts/02_megahit_assembly.sh SRR24575585
bash scripts/03_prodigal_gene_prediction.sh SRR24575585
bash scripts/04b_blastp_pazy.sh SRR24575585
bash scripts/04a_blastp_plasticdb.sh SRR24575585
bash scripts/05_filter_and_prioritize_plasticdb_hits.sh SRR24575585
