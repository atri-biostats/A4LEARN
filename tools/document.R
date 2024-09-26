library(tidyverse)

# Document data dictionary and data_download_date ----
dir.create(file.path("..", "R"))
cat("#' A4 LEARN data dictionaries
#'
#' These data files contain meta data for other data files in this package.
#'
#' @docType data
#' @name datadic
#' @usage data(clinical_datadic)
#' @usage data(derived_datadic)
#' @usage data(external_datadic)
#' @usage data(visits_datadic)
#' @format A data frame
#' @keywords datasets dictionary datadictionary
#' @examples
#' browseVignettes('A4LEARN')
\"clinical_datadic\"

#' @rdname datadic
\"derived_datadic\"

#' @rdname datadic
\"external_datadic\"

#' @rdname datadic
\"visits_datadic\"
NULL

#' A4 LEARN data download date
#'
#' The date when data in this package were downloaded from
#' <https://www.a4studydata.org/>.
#'
#' @docType data
#' @keywords datasets
#' @name data_download_date
#' @usage data(data_download_date)
#' @format A `Date` class object.
#' @examples
#' browseVignettes('A4LEARN')
NULL

", file = file.path("..", "R", "data.R"))

# function for escaping braces
escape <- function(x){
  y <- gsub("{", "\\{", x, fixed = TRUE)
  gsub("}", "\\}", y, fixed = TRUE)
}
# get derived data info ----
derived_datadic <- derived_datadic %>%
  mutate(FILE_NAME = stringr::str_remove(FILE_NAME, ".csv"))
derived_names <- unique(derived_datadic$FILE_NAME)

# Document ATRI derived dataset(s) ----
for(tt in derived_names){
  message(tt)
  assign("dd", get(tt))
  cat(paste0("#' ", tt, ": ", subset(derived_datadic, FILE_NAME == tt)$FILE_LABEL[1]),
    "#' @description ATRI derived analysis dataset.",
    "#' @details",
    "#' \\itemize{",
    paste("#'   \\item", paste0(
      subset(derived_datadic, FILE_NAME == tt)$FIELD_NAME, ": ",
      subset(derived_datadic, FILE_NAME == tt)$FIELD_DESC)),
    "#' }",
    "#' @docType data",
    "#' @keywords datasets",
    paste("#' @name", tt),
    paste0("#' @usage data(", tt, ")"),
    paste("#' @format A data frame with", nrow(dd), "rows and", ncol(dd), "variables."),
    "#' @examples",
    "#' browseVignettes('A4LEARN')",
    "NULL\n", sep = "\n",
    file = file.path("..", "R", "data.R"), append = TRUE)          
}

# Get unique clinical names as lowercap ----
clinical_datadic$CRF_NAME = tolower(clinical_datadic$CRF_NAME)
clinical_names <- unique(clinical_datadic$CRF_NAME)

# Document ATRI clinical dataset(s) ----
for(tt in clinical_names){
  message(tt)
  assign("dd", get(tt))
  cat(paste0("#' ", tt, ": ", subset(clinical_datadic, CRF_NAME == tt)$CRF_LABEL[1]),
    "#' @description ATRI clinical analysis dataset.",
    "#' @details",
    "#' \\itemize{",
    paste("#'   \\item", paste0(
      subset(clinical_datadic, CRF_NAME == tt)$FIELD_NAME, ": ",
      escape(subset(clinical_datadic, CRF_NAME == tt)$FIELD_TEXT))),
    "#' }",
    "#' @docType data",
    "#' @keywords datasets",
    paste("#' @name", tt),
    paste0("#' @usage data(", tt, ")"),
    paste("#' @format A data frame with", nrow(dd), "rows and", ncol(dd), "variables."),
    "#' @examples",
    "#' browseVignettes('A4LEARN')",
    "NULL\n", sep = "\n",
    file = file.path("..", "R", "data.R"), append = TRUE)          
}

# Get unique external dataset(s) ----
external_datadic <- external_datadic %>%
  mutate(FILE_NAME = stringr::str_remove(FILE_NAME, ".csv"))
external_names <- unique(external_datadic$FILE_NAME)

# Document ATRI external dataset(s) ----
for(tt in external_names){
  message(tt)
  assign("dd", get(tt))
  cat(paste0("#' ", tt, ": ", subset(external_datadic, FILE_NAME == tt)$FILE_LABEL[1]),
    "#' @description ATRI external analysis dataset.",
    "#' @details",
    "#' \\itemize{",
    paste("#'   \\item", paste0(
      subset(external_datadic, FILE_NAME == tt)$FIELD_NAME, ": ",
      escape(subset(external_datadic, FILE_NAME == tt)$FIELD_DESC))),
    "#' }",
    "#' @docType data",
    "#' @keywords datasets",
    paste("#' @name", tt),
    paste0("#' @usage data(", tt, ")"),
    paste("#' @format A data frame with", nrow(dd), "rows and", ncol(dd), "variables."),
    "#' @examples",
    "#' browseVignettes('A4LEARN')",
    "NULL\n", sep = "\n",
    file = file.path("..", "R", "data.R"), append = TRUE)          
}

message("Dataset documentation created in data.R.")

# Add static documents ----
doc_files <- list.files(file.path('..', 'data-raw', 'Documents'), 
  pattern = "\\.pdf$", full.names = TRUE, recursive = TRUE)
# skip dynamic vignette
doc_files <- setdiff(doc_files, 
  c("../data-raw/Documents/FAQ + Guides/Intro-to-A4-data.pdf",
    "../data-raw/Documents/FAQ + Guides/a4_learn_data_primer.pdf"))
for (file_name in doc_files) {
  doc_name <- gsub("\\.pdf$", "", basename(file_name))
  file.copy(file_name, file.path('..', 'vignettes', 
    paste0(doc_name,'_original.pdf')))
  cat("\\documentclass{article}",
    "\\usepackage{pdfpages}",
    paste0("%\\VignetteIndexEntry{", doc_name, "}"),
    "\\begin{document}",
    paste0("\\includepdf[pages=-, fitpaper=true]{", paste0(doc_name,'_original.pdf'), "}"),
    "\\end{document}", 
    file = file.path('..', 'vignettes', paste0(doc_name, '.Rnw')),
    sep = '\n')
}
