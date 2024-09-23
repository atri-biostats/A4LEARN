# Script setup ----
library(tidyverse); library(devtools);
# TODO CHANGE PATH
setwd("~/Downloads/A4LEARN/A4LEARN/")

# Read in csv files ----
## list all csv files under data folder
source("../tools/make_dir.R")
  
safe.dir.create("./data")
csv_files <- list.files("../A4LEARN-20240917", pattern = "\\.csv$", full.names = TRUE, recursive = TRUE)
for (file in csv_files) {
  var_name <- gsub("\\.csv$", "", basename(file))
  data <- read_csv(file)
  assign(var_name, data)
  save(list = var_name, file = file.path("data", paste0(var_name, ".rda")))
}

# Document all ATRI dataset(s) ----
source("../tools/datadic.R")

# Generate documentation and build the R package ----
document()
check(error_on = "error")
pkg_dir <- build()
install.packages(pkg_dir, repos = NULL, type = "source")