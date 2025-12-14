#!/usr/bin/env bash
set -euo pipefail

INPUT="results/blast/SRR28167100_vs_PlasticDB.filtered.tsv"
OUTDIR="results/summary"

mkdir -p "$OUTDIR"

# Step 1: high-confidence PlasticDB-only hits
awk '
{
  gene=$1
  ref=$2
  pid=$3
  alen=$4
  qlen=$6
  evalue=$11
  bits=$12
  cov=alen/qlen

  if (pid >= 35 && cov >= 0.6) {
    print gene "\t" ref "\t" pid "\t" cov "\t" evalue "\t" bits
  }
}
' "$INPUT" \
> "$OUTDIR/plasticdb_only_highconf_annotated.tsv"

# Normalize decimals
sed -i 's/,/./g' "$OUTDIR/plasticdb_only_highconf_annotated.tsv"

# Step 2: keep best hit per gene (highest bitscore)
sort -k1,1 -k6,6nr "$OUTDIR/plasticdb_only_highconf_annotated.tsv" \
| awk '!seen[$1]++' \
> "$OUTDIR/plasticdb_only_highconf_besthit.tsv"
