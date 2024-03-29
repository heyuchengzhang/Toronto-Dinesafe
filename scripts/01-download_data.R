#### Preamble ####
# Purpose: Downloads and saves the Dinesafe raw data from Open Data Toronto
# Author: Heyucheng Zhang
# Date: 17 January 2024 
# Contact: heyucheng.zhang@mail.utoronto.ca
# License: None
# Pre-requisites: 00-simulate_data.R


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
# Load the package
package <- show_package("ea1d6e57-87af-4e23-b722-6c1f5aa18a8d")

# List the resources in the package
resources <- list_package_resources("ea1d6e57-87af-4e23-b722-6c1f5aa18a8d")

# Filter the resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# Select the second resource and download it
data <- filter(datastore_resources, row_number()==2) %>% get_resource()

#### Save data ####
write_csv(data, "inputs/data/raw_data.csv") 
