#### Preamble ####
# Purpose: Cleans the raw data the Dinesafe raw data from "inputs/data/raw_data.csv"
# Author: Heyucheng Zhang
# Date: 17 January 2024 
# Contact: heyucheng.zhang@mail.utoronto.ca
# License: None
# Pre-requisites: 00-simulate_data.R and 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####

# Read data
raw_data <- read_csv("inputs/data/raw_data.csv")

# Clean data
cleaned_data <-
  raw_data |>
  clean_names() |> # Clean names
  mutate(inspection_date = ymd(inspection_date)) |> # Convert date format
  filter(severity %in% c("C - Crucial", "S - Significant")) |> # Filter the rows based on whether the "severity" is "C-crucial" or "S-significant."
  select(establishment_type, severity, inspection_date) # Select the columns "establishment_type", "severity", and "inspection_date".


#### Save data ####
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")
