library(tidyverse); library(devtools);

# Read in csv files ----
dir.create('../data')
data_download_date <- as.Date("2024-09-17")
usethis::use_data(data_download_date, overwrite = TRUE)
csv_files <- list.files("./", pattern = "\\.csv$", full.names = TRUE, recursive = TRUE)
for (file_name in csv_files) {
  df_name <- gsub("\\.csv$", "", basename(file_name))
  df <- read_csv(file_name)
  if('VISCODE' %in% colnames(df)) df <- mutate(df, VISCODE = as.numeric(VISCODE))
  assign(df_name, df)
  # using defaults from usethis::use_data
  save(list = df_name, file = file.path("..", "data", paste0(df_name, ".rda")),
    compress = "bzip2", version = 2)
}

# Code ptdemog ----

get_levels <- function(x){
  as.numeric(unlist(lapply(strsplit(unlist(strsplit(subset(
    clinical_datadic, FIELD_NAME==x)$FIELD_CODE, ';')), '='), function(y) y[1])))
}
get_labels <- function(x){
  unlist(lapply(strsplit(unlist(strsplit(subset(
    clinical_datadic, FIELD_NAME==x)$FIELD_CODE, ';')), '='), function(y) y[2]))
}

ptdemog <- ptdemog %>%
  mutate(
    PTGENDER = factor(PTGENDER, 
      levels = get_levels('PTGENDER'),
      labels = get_labels('PTGENDER')),
    PTETHNIC = factor(PTETHNIC, 
      levels = get_levels('PTETHNIC'),
      labels = get_labels('PTETHNIC')),
    PTMARRY = factor(PTMARRY, 
      levels = get_levels('PTMARRY'),
      labels = get_labels('PTMARRY')),
    PTNOTRT = factor(PTNOTRT, 
      levels = get_levels('PTNOTRT'),
      labels = get_labels('PTNOTRT')))

race.levs <- get_levels('PTRACE')
race.labs <- get_labels('PTRACE')
for (i in 1:length(race.levs)){
  ptdemog[!is.na(ptdemog$PTRACE),  paste('PTRACE:',race.labs[i])] <- 0
  ptdemog[grep(race.levs[i], ptdemog$PTRACE, fixed = TRUE), paste('PTRACE:',race.labs[i])] <- 1
}

usethis::use_data(ptdemog, overwrite = TRUE)

# Code SUBJINFO ----

SUBJINFO <- SUBJINFO %>%
  mutate(
    AGECAT = case_when(AGEYR < 65 ~ "Age < 65",
      AGEYR >= 65 & AGEYR < 75 ~ "65 <= Age < 75",
      AGEYR >= 75 & AGEYR < 85 ~ "75 <= Age < 85",
      AGEYR >= 85 ~ "Age >= 85"),
    SEX = factor(case_when(
      SEX == 1 ~ "Female",
      SEX == 2 ~ "Male"), levels = c("Male", "Female")),
    RACE = case_when(RACE == 1 ~ "White",
      RACE == 2 ~ "Black or African American",
      RACE == 58 ~ "Asian",
      RACE == 79 ~ "Native Hawaiian or Other Pacific Islander",
      RACE == 84 ~ "American Indian or Alaskan Native",
      RACE == 97 ~ "Unknown or Not Reported",
      RACE == 100 ~ "More than one race"),
    MARITAL = case_when(MARITAL == 2 ~ "Divorced",
      MARITAL == 4 ~ "Never married",
      MARITAL == 5 ~ "Widowed",
      MARITAL == 11 ~ "Married",
      MARITAL == 97 ~ "Unknown or Not Reported"),
    ETHNIC = case_when(ETHNIC == 50 ~ "Hispanic or Latino",
      ETHNIC == 56 ~ "Not Hispanic or Latino",
      ETHNIC == 97 ~ "Unknown or Not reported"),
    ALCHLBL = case_when(ALCHLBL == 0 ~ "No",
      ALCHLBL == 1 ~ "Yes"),
    CFBL = case_when(CFBL == 0 ~ "No",
      CFBL == 1 ~ "Yes"),
    TBBL = case_when(TBBL == 0 ~ "No",
      TBBL == 1 ~ "Yes"),
    WRKRET = case_when(WRKRET == 1 ~ "Yes",
      WRKRET == 0 ~ "No",
      WRKRET == 96 ~ "Not Applicable"),
    APOEGNPRSNFLG = case_when(APOEGNPRSNFLG == 1 ~ "Yes",
      APOEGNPRSNFLG == 0 ~ "No"),
    AGEYR = as.numeric(AGEYR),
    SUVRCER = as.numeric(SUVRCER),
    AMYLCENT = as.numeric(AMYLCENT),
    EDCCNTU = as.numeric(EDCCNTU),
    COGDSSTTSV6 = as.numeric(COGDSSTTSV6),
    COGLMDRTSV6 = as.numeric(COGLMDRTSV6),
    TX = factor(TX, levels = c("Placebo", "Solanezumab")))
    # COMPLETER = case_when(
    #   SUBJCOMPTR == 1 ~ "Completer",
    #   TRUE ~ "Dropout"))

usethis::use_data(SUBJINFO, overwrite = TRUE)

# Code imaging_PET_VA ----
imaging_PET_VA <- imaging_PET_VA  %>%
  mutate(
    elig_vi_1 = factor(elig_vi_1, 
      levels = c('negative', 'positive'),
      labels = c('Negative', 'Positive')),
    elig_vi_2 = factor(elig_vi_2, 
      levels = c('negative', 'positive'),
      labels = c('Negative', 'Positive')),
    overall_score = factor(overall_score, 
      levels = c('negative', 'positive'),
      labels = c('Negative', 'Positive')))
  
usethis::use_data(imaging_PET_VA, overwrite = TRUE)
