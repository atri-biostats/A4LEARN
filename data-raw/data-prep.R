library(tidyverse); library(devtools);

# Read in csv files ----
dir.create('../data')
data_download_date <- as.Date("2024-09-17")
usethis::use_data(data_download_date)
csv_files <- list.files("./", pattern = "\\.csv$", full.names = TRUE, recursive = TRUE)
for (file_name in csv_files) {
  df_name <- gsub("\\.csv$", "", basename(file_name))
  df <- read_csv(file_name)
  assign(df_name, df)
  # using defaults from usethis::use_data
  save(list = df_name, file = file.path("..", "data", paste0(df_name, ".rda")),
    compress = "bzip2", version = 2)
}
