# Methods: Targeted Screening for Plastic-Degradation Genes

This section describes the methodological rationale behind the bioinformatics workflow implemented in this repository.  
The emphasis is placed on conservative detection, reproducibility, and transparent decision-making.

---

## Overall Strategy

Rather than performing full functional annotation of the metagenome, a targeted screening approach was applied.

This strategy aims to answer a focused biological question:

> Does this environmental metagenome contain genes similar to **known plastic-degrading enzymes**?

The workflow is therefore designed to **detect genetic potential**, not to infer activity or degradation rates.

---

## Quality Control and Assembly

Raw shotgun metagenomic reads were quality-filtered using `fastp` to remove low-quality bases and adapter contamination.

Assembly was performed using `MEGAHIT`, which is optimized for large and complex metagenomic datasets.  
Assembled contigs increase the sensitivity and reliability of downstream homology-based gene detection compared to read-level searches.

---

## Gene Prediction

Open reading frames were predicted using `Prodigal` in metagenomic mode.

Only predicted protein sequences were used for functional screening, as protein-level similarity is more informative for enzyme detection than nucleotide-level comparisons.

---

## Reference Databases

### PlasticDB

PlasticDB was used as a broad reference collection of plastic-associated and plastic-degrading enzymes reported in the literature.

This database includes enzymes with varying levels of experimental support and provides **high sensitivity** for detecting candidate genes.

---

### PAZy (Plastics-Active Enzymes Database)

PAZy was used as a **high-confidence reference database**, as it contains only biochemically characterized plastic-active enzymes.

Because PAZy is intentionally conservative and relatively small, hits against this database are interpreted as **strong evidence of functional similarity**.

Using both databases allows a balance between sensitivity (PlasticDB) and specificity (PAZy).

---

## Similarity Search

Protein sequences predicted from the metagenome were searched against both databases using `blastp`.

BLAST was chosen instead of profile HMMs for the following reasons:

- Transparent alignment-based interpretation
- Suitable for relatively small, curated reference sets
- Easier threshold justification in an educational and exploratory context

---

## Filtering Criteria

BLAST hits were filtered using conservative thresholds based on:

- Minimum percent identity
- Minimum alignment length
- Minimum query coverage

These criteria aim to reduce spurious matches to generic hydrolases while retaining candidates plausibly related to plastic degradation.

Thresholds were intentionally chosen to favor **specificity over sensitivity**.

---

## Interpretation of Results

Detected genes are interpreted as **putative candidates** based on sequence similarity alone.

No claims are made regarding:

- Enzymatic activity
- Expression levels
- In situ plastic degradation

The results represent a **screening-level assessment** of genetic potential in the analyzed metagenome.

---

## Limitations

This approach does not detect:

- Novel plastic-degrading enzymes without homology to known references
- Regulatory or expression-level information
- Polymer specificity beyond database annotation

These limitations are inherent to similarity-based screening and are explicitly acknowledged.

---

## Reproducibility

All analyses were performed using open-source tools with documented parameters.

Scripts, reference data, and intermediate results are version-controlled to ensure reproducibility and transparency.
