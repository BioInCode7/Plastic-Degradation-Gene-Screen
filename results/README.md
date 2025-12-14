## Quality control summary (SRR28167100)

- >99.9% of reads retained after filtering
- Low duplication rate (~1.6%)
- High base quality (Q30 >94%)
- GC content ~64%, consistent with enriched environmental microbiomes

These results indicate high-quality input data suitable for metagenomic assembly.


## Metagenome assembly (SRR28167100)

- Assembler: MEGAHIT v1.2.9
- Preset: meta-sensitive
- Minimum contig length: 1 kb
- Total assembled size: 234.6 Mb
- Number of contigs: 66,727
- N50: 6.3 kb
- Longest contig: 1.77 Mb

The assembly shows typical fragmentation for complex landfill microbiomes
and is suitable for downstream gene prediction and functional screening.

## Comparative summary

The file `results/summary/comparative_summary.tsv` provides a direct comparison of plastic-degradation gene potential across environments.

It summarizes:
- high-confidence PlasticDB hits
- PlasticDB grey-zone candidates
- PAZy hits
- shared genes between PAZy and PlasticDB

This table serves as the main quantitative basis for the environmental contrast discussed in `results/interpretation.md`.

