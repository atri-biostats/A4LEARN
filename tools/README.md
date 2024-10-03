# Building A4LEARN from csv files <a href="https://www.a4studydata.org/"><img src="../man/figures/logo.png" align="right" height="138" /></a>

To generate the package from source csv files:

- clone this repository
- download A4 and LEARN clinical data from either <https://www.a4studydata.org/> or <https://www.synapse.org/a4_learn_datasharing> and
  copy all directories to [data-raw](data-raw)
- `source('data-raw/data-prep.R', chdir=TRUE)` to convert
  `data-raw/*.csv` files to `data/*.rda` files
- `source('tools/build.R', chdir=TRUE)` to generate documentation and
  build R package
