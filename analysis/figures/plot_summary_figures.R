#!/usr/bin/env Rscript

# ============================================================
# Plastic-Degradation-Gene-Screen
# Figure generation script
#
# Generates:
# 1) Venn diagram: PlasticDB vs PAZy candidate genes
# 2) Bar plot: PAZy hits by polymer type
#
# Author: Jesús Salinas
# ============================================================

# -------------------------------
# Load libraries
# -------------------------------
suppressPackageStartupMessages({
  library(tidyverse)
  library(VennDiagram)
  library(grid)
})

# -------------------------------
# Define paths
# -------------------------------
summary_dir <- "results/summary"
figures_dir <- "results/figures"

dir.create(figures_dir, showWarnings = FALSE, recursive = TRUE)

# -------------------------------
# Figure 1: Venn diagram
# PlasticDB vs PAZy
# -------------------------------

plasticdb_genes <- readLines(
  file.path(summary_dir, "plasticdb_hits_genes.txt")
)

pazy_genes <- readLines(
  file.path(summary_dir, "pazy_hits_genes.txt")
)

venn_plot <- venn.diagram(
  x = list(
    PlasticDB = plasticdb_genes,
    PAZy = pazy_genes
  ),
  filename = NULL,
  fill = c("#1f78b4", "#33a02c"),
  alpha = 0.6,
  cex = 1.4,
  cat.cex = 1.4,
  cat.pos = c(-20, 20),
  margin = 0.1
)

png(
  filename = file.path(figures_dir, "venn_plasticdb_pazy.png"),
  width = 1600,
  height = 1600,
  res = 200
)
grid.draw(venn_plot)
dev.off()

message("Venn diagram saved: venn_plasticdb_pazy.png")

# -------------------------------
# Figure 2: PAZy hits by polymer
# -------------------------------

pazy_polymer <- read.table(
  file.path(summary_dir, "pazy_hits_by_polymer.txt"),
  fill = TRUE,
  col.names = c("count", "polymer"),
  stringsAsFactors = FALSE
)

pazy_polymer$polymer[pazy_polymer$polymer == ""] <- "Unknown"

# Remove empty polymer labels if present
pazy_polymer <- pazy_polymer %>%
  filter(polymer != "")

pazy_polymer$polymer <- factor(
  pazy_polymer$polymer,
  levels = pazy_polymer$polymer[order(-pazy_polymer$count)]
)

bar_plot <- ggplot(pazy_polymer, aes(x = polymer, y = count)) +
  geom_col(fill = "#33a02c") +
  theme_minimal(base_size = 14) +
  labs(
    title = "PAZy candidate hits by polymer type",
    x = "Polymer",
    y = "Number of hits"
  )

ggsave(
  filename = file.path(figures_dir, "pazy_hits_by_polymer.png"),
  plot = bar_plot,
  width = 6,
  height = 5,
  dpi = 300
)

message("Bar plot saved: pazy_hits_by_polymer.png")

# -------------------------------
# Done
# -------------------------------
message("All figures generated successfully.")
