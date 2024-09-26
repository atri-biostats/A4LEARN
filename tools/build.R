library(tidyverse); library(devtools);

# Document all ATRI dataset(s) ----
source("document.R")

# Generate documentation, build, and install the R package ----
document()
check(error_on = "error")
pkg_dir <- build()
install.packages(pkg_dir, repos = NULL, type = "source")

# Build README.md ----
build_readme()

# Build websiet ----
# usethis::use_pkgdown()
# setwd('../')
# pkgdown::build_site()
# usethis::use_pkgdown_github_pages()