# Plastic-Degradation-Gene-Screen

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

The current implementation focuses on a single dataset to prioritize clarity and reproducibility.

**Selected dataset:**
- Sediment shotgun metagenome from arid-tropical natural wetlands  
  (BioProject **PRJNA972844**)

---

## Project status

✅ **Phase 1 complete**  
Core pipeline implemented, documented, and validated on one environmental metagenome.  
Current results are exploratory and intended to support comparative analyses.

Next step: replication of the workflow across additional metagenomes.

---

## Author

**Jesús Salinas**  
Postdoctoral Researcher, Universidad de Almería
