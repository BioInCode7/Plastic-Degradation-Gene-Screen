library(tidyverse)

df <- read_tsv("results/summary/comparative_summary.tsv")

df_long <- df %>%
  select(Sample, Environment,
         PlasticDB_highconf,
         PlasticDB_greyzone,
         PAZy_hits) %>%
  pivot_longer(
    cols = -c(Sample, Environment),
    names_to = "Category",
    values_to = "Count"
  )

df_long$Category <- recode(df_long$Category,
                           PlasticDB_highconf = "PlasticDB high-confidence",
                           PlasticDB_greyzone = "PlasticDB grey-zone",
                           PAZy_hits = "PAZy")

p <- ggplot(df_long, aes(x = Category, y = Count, fill = Environment)) +
  geom_col(position = "dodge") +
  theme_minimal(base_size = 13) +
  labs(
    title = "Plastic-degradation gene potential across environments",
    y = "Number of genes",
    x = ""
  ) +
  scale_fill_brewer(palette = "Set2") +
  theme(
    axis.text.x = element_text(angle = 20, hjust = 1),
    legend.title = element_blank()
  )

ggsave(
  "results/figures/comparative_cowdung_vs_sediment.png",
  p,
  width = 8,
  height = 5
)
