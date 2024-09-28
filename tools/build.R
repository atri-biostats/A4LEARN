library(tidyverse); library(devtools);

# Load data ----
devtools::load_all('../')

# Document all ATRI dataset(s) ----
source("document.R")

# Generate documentation, build, and install the R package ----
document()
check(error_on = "error")
pkg_dir <- build(args="--compact-vignettes=both")
install.packages(pkg_dir, repos = NULL, type = "source")

# Build README.md ----
build_readme()

# Build website ----
# run once:
# usethis::use_pkgdown()
# setwd('../')
# pkgdown::build_site()
# publish online:
# pkgdown::deploy_to_branch()
