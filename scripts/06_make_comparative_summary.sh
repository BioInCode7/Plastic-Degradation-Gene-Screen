#!/usr/bin/env bash
set -euo pipefail

OUT="results/summary/comparative_summary.tsv"

echo -e "Sample\tEnvironment\tPlasticDB_highconf\tPlasticDB_greyzone\tPAZy_hits\tShared_PAZy_PlasticDB" > "$OUT"

count_lines () {
  FILE=$1
  [[ -f "$FILE" ]] && wc -l < "$FILE" || echo 0
}

add_sample () {
  SAMPLE=$1
  ENV=$2

  HIGHCONF=$(count_lines results/summary/${SAMPLE}_plasticdb_only_highconf_besthit.tsv)
  GREY=$(count_lines results/summary/${SAMPLE}_plasticdb_grayzone_top_candidates.tsv)

  PAZY=$(cut -f1 results/blast/${SAMPLE}_vs_PAZy.tsv 2>/dev/null | sort -u | wc -l || echo 0)

  SHARED=$(comm -12 \
    <(cut -f1 results/summary/${SAMPLE}_plasticdb_only_highconf_besthit.tsv 2>/dev/null | sort -u) \
    <(cut -f1 results/blast/${SAMPLE}_vs_PAZy.tsv 2>/dev/null | sort -u) | wc -l || echo 0)

  echo -e "${SAMPLE}\t${ENV}\t${HIGHCONF}\t${GREY}\t${PAZY}\t${SHARED}" >> "$OUT"
}

add_sample SRR28167100 "Cow dung (plastic-enriched)"
add_sample SRR24575585 "Wetland sediment"
