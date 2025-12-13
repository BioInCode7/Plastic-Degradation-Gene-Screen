# Plastic-Degradation-Gene-Screen

## Overview

Plastic pollution is a major environmental problem, and microbial biodegradation is considered a promising natural mitigation strategy.  
This project explores whether **metagenomic data from environmental samples contains genetic potential for plastic degradation**, focusing on known plastic-degrading enzymes.

Rather than performing full functional annotation, this project applies a **targeted, question-driven approach** to screen for specific genes of interest.

---

## ❓ Biological Question

Can we detect and quantify genes associated with plastic biodegradation in environmental metagenomes using a simple, reproducible bioinformatics workflow?

---

## 🌍 Environmental Context

Environmental microbiomes (soil, sediment, wastewater, marine environments) are highly diverse and may harbor enzymes capable of degrading synthetic polymers such as PET.

Identifying this genetic potential is a first step toward:
- understanding natural plastic degradation
- selecting candidate environments for bioremediation
- guiding future functional or experimental studies

---

## 🧪 Data

This project uses **publicly available shotgun metagenomic datasets** from environmental samples (e.g. soil, sediment, or wastewater), obtained from NCBI/ENA.

The initial version of the pipeline focuses on **one dataset**, prioritizing clarity and reproducibility over scale.

---

## 🧬 Target Genes

The analysis focuses on a curated set of enzymes reported to be involved in plastic degradation, including:

- PETase
- MHETase
- Cutinase-like enzymes
- Esterases related to polymer degradation

The gene list can be extended in future versions.

---

## 🧠 Scientific Outcome

The pipeline produces:
- a list of detected plastic-degradation-related genes
- basic abundance estimates
- a summary table suitable for downstream interpretation

This allows an informed decision on whether a given environment shows **genetic potential for plastic biodegradation**, without overinterpreting the data.

---

## 🔁 Workflow Philosophy

This project emphasizes:
- clear biological motivation
- minimal but sufficient tooling
- reproducibility
- transparent decision-making

It is designed as a learning-oriented, extensible framework rather than a production-scale pipeline.

---

## 🛠 Planned Workflow (v1)

1. Quality control of raw reads  
2. Metagenome assembly  
3. Gene prediction  
4. Targeted functional screening (BLAST/HMM-based)  
5. Result summarization and visualization  

---

## 📦 Reproducibility

The workflow will be implemented using:
- open-source tools
- documented parameters
- environment management (Conda)

---

## 📌 Project Status

🚧 Work in progress — initial development and testing phase.

---

## 📥 Dataset público seleccionado

- **Sediment shotgun metagenome from arid-tropical natural wetlands** (BioProject **PRJNA972844**).  
  Secuencias crudas disponibles en NCBI SRA (por ejemplo, SRX20358958, SRX20358957, …).  


## 👤 Author

Jesús Salinas - Postodtoral Reasearcher UAL
