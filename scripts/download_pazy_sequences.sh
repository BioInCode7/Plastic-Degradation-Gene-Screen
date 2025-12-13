#!/bin/bash
set -euo pipefail

IDS=data/databases/pazy/pazy_ids_proteins.tsv
OUT=data/databases/pazy/pazy_proteins.faa

> "$OUT"

while IFS=$'\t' read -r ID SOURCE POLYMER; do
  [[ "$ID" == "ID" ]] && continue

  echo "Downloading $ID ($SOURCE)"

  if [[ "$SOURCE" == "UniProt" ]]; then
    curl -fs "https://rest.uniprot.org/uniprotkb/${ID}.fasta" >> "$OUT"
  else
    efetch -db protein -id "$ID" -format fasta >> "$OUT"
  fi

done < "$IDS"
