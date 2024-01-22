#### Preamble ####
# Purpose: Tests the cleaned data from "outputs/data/cleaned_data.csv"
# Author: Heyucheng Zhang
# Date: 17 January 2024 
# Contact: heyucheng.zhang@mail.utoronto.ca
# License: None
# Pre-requisites: 00-simulate_data.R，01-download_data.R and 02-data_cleaning.R


#### Workspace setup ####
library(tidyverse)

#### Test data ####
cleaned_data <- read_csv("outputs/data/cleaned_data.csv")

cleaned_data$severity |>
  unique() |>
  length() == 2

cleaned_data$severity |>
  unique() == c("C - Crucial", "S - Significant")

cleaned_data$establishment_type |>
  class() == "character"

cleaned_data$severity |>
  class() == "character"

#### Test result ####
# Result: All TRUE
