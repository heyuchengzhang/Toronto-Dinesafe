#### Preamble ####
# Purpose: Explore the cleaned data from "outputs/data/cleaned_data.csv"
# Author: Heyucheng Zhang
# Date: 17 January 2024 
# Contact: heyucheng.zhang@mail.utoronto.ca
# License: None
# Pre-requisites: 00-simulate_data.R，01-download_data.R 02-data_cleaning.R and 03-test_data.R


#### Workspace setup ####
install.packages("knitr")
library(tidyverse)
library(knitr)

#### Explore ####
# Read data
cleaned_data <- read_csv("outputs/data/cleaned_data.csv")

# Make a summary of infractions by establishment type
summary <- cleaned_data |>
  # Group data by establishment type
  group_by(establishment_type) |> 
  # Calculate the sum of significant and crucial infractions
  summarise(significant_infractions = sum(severity == "S - Significant"),
            crucial_infractions = sum(severity == "C - Crucial")) |> 
  # Add a new column to sum the significant and crucial infractions for total infractions
  mutate(total_infractions = significant_infractions + crucial_infractions) |>
  # Ungroup data
  ungroup() |>
  # Arrange data in descending order of total infractions
  arrange(desc(total_infractions))

# Extract the top 10 records and the bottom 10 records
top_10 <- head(summary, 10)
summary_asc <- summary |> arrange(total_infractions)
bottom_10 <- head(summary_asc, 10)

#### Tables ####

# Make tables by using knitr
top_10 |> kable()
bottom_10 |> kable()

#### Graphs ####

# Make graphs by using ggplot2
top_10 |> 
  ggplot(aes(x = reorder(establishment_type, total_infractions), 
             y = total_infractions, fill = establishment_type)) +
  geom_col() +
  labs(title = "The Top 10 Establishment Types with the Most Infractions",
       x = "Establishment Type", y = "Total Infractions") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

bottom_10 |>
  ggplot(aes(x = reorder(establishment_type, total_infractions), 
             y = total_infractions, fill = establishment_type)) +
  geom_col() +
  labs(title = "The Top 10 Establishment Types with the Fewest Infractions",
       x = "Establishment Type", y = "Total Infractions") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#### Save analysis data ####
write_csv(summary, "outputs/data/analysis_data.csv")
