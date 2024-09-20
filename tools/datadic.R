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
      "NULL",
      sep = "",
      file = file.path(".", "R", "dataDoc.R"), append = TRUE)
}