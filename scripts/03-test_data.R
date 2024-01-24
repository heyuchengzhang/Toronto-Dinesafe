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

# Read data
cleaned_data <- read_csv("outputs/data/cleaned_data.csv")

# Test if there are 2 unique severity levels in the "severity" column
cleaned_data$severity |>
  unique() |>
  length() == 2

# Test the unique values in the "severity" column are "C - Crucial" and "S - Significant"
cleaned_data$severity |>
  unique() == c("C - Crucial", "S - Significant")

# Test if the "establishment_type" column is a character data type.
cleaned_data$establishment_type |>
  class() == "character"

# Test if the "severity" column is a character data type.
cleaned_data$severity |>
  class() == "character"

#### Test result ####
# Result: All TRUE
