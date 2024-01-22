#### Preamble ####
# Purpose: Simulates Data
# Author: Heyucheng Zhang
# Date: 17 January 2024 
# Contact: heyucheng.zhang@mail.utoronto.ca
# License: None
# Pre-requisites: None


#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("knitr")
install.packages("tidyverse")
library(knitr)
library(opendatatoronto)
library(tidyverse)

#### Simulate data ####
set.seed(123)

number_of_days <- 730
establishment_types <- c("Restaurant", "Food Take Out", "Supermarket", "Food Court Vendor", "Bakery")

simulated_data <- tibble(
  establishment_type = rep(establishment_types, each = number_of_days),
  severity = sample(c("C - Crucial", "S - Significant"), size = length(establishment_types) * number_of_days, replace = TRUE),
  inspection_date = rep(seq(as.Date("2022-01-18"), length.out = number_of_days, by = "day"), times = length(establishment_types)),
  ) |>
  arrange(inspection_date)

head(simulated_data)
