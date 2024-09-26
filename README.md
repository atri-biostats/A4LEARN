
<!-- README.md is generated from README.Rmd. Please edit that file -->

# A4LEARN <a href="https://www.a4studydata.org/"><img src="A4LEARN/man/figures/logo.png" align="right" height="138" /></a>4LEARN

This is an R data package for the Anti-Amyloid Treatment in Asymptomatic
Alzheimer’s (A4) and Longitudinal Evaluation of Amyloid Risk and
Neurodegeneration (LEARN) study. All raw/derived datasets are included
as shared on <https://www.a4studydata.org/>.

## Installation

To generate the package:

- clone this repository
- download A4 and LEARN data from <https://www.a4studydata.org/> and
  move to [data-raw](data-raw)
- `source('data-raw/data-prep.R', chdir=TRUE)` to convert
  `data-raw/*.csv` files to `data/*.rda` files
- `source('tools/build.R')` to generate documentation and build R
  package

## Example

The document demonstrates how to reproduce some primary findings of the
A4 trial (Sperling et al. 2023) using R. Data were downloaded from
<https://www.a4studydata.org/> on 2024-09-17.

## Load required R packages

``` r
library(tidyverse)
library(arsenal)
library(kableExtra)
library(nlme)
library(emmeans)
library(splines)
library(clubSandwich)
library(A4LEARN)

formatp <- function(x) case_when(
  x < 0.001 ~ "p<0.001",
  x > 0.01 ~ Hmisc::format.pval(x, digits=2, eps=0.01, nsmall=2),
  TRUE ~ Hmisc::format.pval(x, digits=3, eps=0.001, nsmall=3))
```

## Read data

``` r
# Participant characteristics data:
SUBJINFO_raw <- SUBJINFO
# Longitudinal PACC data from Analysis Data Questionnaire Scores (ADQS):
ADQS_raw <- ADQS
```

## Data manipulations

``` r
# Outcomes collected at Visit 1
V1OUTCOME <- ADQS_raw %>%
  dplyr::filter(VISITCD == "001") %>%
  select(BID, QSTESTCD, QSSTRESN) %>%
  pivot_wider(values_from = QSSTRESN, names_from = QSTESTCD)

# Outcomes collected at Visit 6
V6OUTCOME <- ADQS_raw %>%
  dplyr::filter(VISITCD == "006") %>%
  select(BID, QSTESTCD, QSSTRESN) %>%
  pivot_wider(values_from = QSSTRESN, names_from = QSTESTCD)

SUBJINFO <- SUBJINFO_raw %>%
  left_join(V6OUTCOME, by = "BID") %>%
  left_join(V1OUTCOME %>%
      select(BID, CDRSB, CFITOTAL, CFISP, CFIPT, ADLPQPT, ADLPQSP), 
    by = "BID") %>%
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
    TX = factor(TX, levels = c("Placebo", "Solanezumab")),
    COMPLETER_label = case_when(
      SUBJCOMPTR == 1 ~ "Completer",
      TRUE ~ "Dropout"))

# Filter ADQS_raw for PACC collected in the blinded phases among mITT population
ADQS_PACC <- ADQS_raw %>%
  dplyr::filter(MITTFL== 1) %>%
  dplyr::filter(EPOCH == "BLINDED TREATMENT") %>%
  dplyr::filter(QSTESTCD == "PACC") %>%
  rename(PACC = QSSTRESN) %>%
  select(BID, ASEQNCS, TX, ADURW, TX, AGEYR, 
    AAPOEGNPRSNFLG, EDCCNTU, SUVRCER, QSVERSION, PACC) %>%
  mutate(TX = factor(TX, levels = c("Placebo", "Solanezumab"))) %>%
  na.omit()
```

## Baseline demographics

``` r
A4labels <- list(TX = "Treatment group", AGEYR = "Age (y)", 
  EDCCNTU = "Education (y)", SUVRCER = "FBP SUVr", AMYLCENT = "FBP Centiloid", 
  LMIIa = "LM Delayed Recall",  MMSE = "MMSE", 
  CFITOTAL = "CFI Combined", ADLPQSP = "ADL Partner", CDRSB = "CDR-SB",
  SEX = "Sex", RACE = "Racial categories", ETHNIC = "Ethnicity", 
  MARITAL = "Marital Status",  WRKRET = "Retirement Status", 
  APOEGNPRSNFLG = "APOE e4", APOEGN = "APOE Genotype")

table1 <- tableby(TX ~ AGEYR + EDCCNTU + SEX + RACE + ETHNIC + MARITAL + WRKRET + 
    SUVRCER + AMYLCENT + chisq(APOEGN) + chisq(APOEGNPRSNFLG) + 
    PACC + LMIIa + MMSE + CFITOTAL + ADLPQSP + CDRSB, 
  data = SUBJINFO %>% dplyr::filter(MITTFL== 1), 
  control = tableby.control(test=TRUE,
    stats.labels = list(Nmiss = "Missing")))

output_format <- knitr::opts_knit$get("rmarkdown.pandoc.to")

if(!is.null(output_format) && output_format == "latex"){
  # format table for pdf document
  table1 %>%
    summary(labelTranslations = A4labels, digits = 1, text = "latex") %>%
    kable(format="latex", escape = FALSE, longtable = T, booktabs = TRUE, 
      linesep = "", row.names = FALSE,
      caption = "Baseline characteristics.") %>%
    kable_styling(latex_options = c("HOLD_position", "repeat_header")) %>% 
    column_spec(1, width = "17 em") %>%
    column_spec(2:4, width = "6 em")
}

if(!is.null(output_format) && output_format == "html"){
  # format table for html
  summary(table1, labelTranslations = A4labels, digits = 1, 
    title = "Baseline characteristics.")
}
```

## PACC Data

Preclinical Alzheimer Cognitive Composite (PACC,
@donohue2014preclinical) data was modelled using natural cubic splines
as described in @donohue2023natural. The fixed effects included the
following terms: (i) spline basis expansion terms (two terms), (ii)
spline basis expansion terms-by-treatment interaction (two terms), (iii)
PACC test version administered, (iv) baseline age, (v) education, (vi)
APOE4 Carrier Status (yes/no), and (vii) baseline florbetapir cortical
SUVr. The model is constrained to not allow a difference between
treatment group means at baseline. The following variance-covariance
structures were assumed in sequence until a model converged: (i)
heterogeneous unstructured, (ii) heterogeneous Toeplitz, (iii)
heterogeneous autoregressive order 1, (iv) heterogeneous compound
symmetry, and (v) compound symmetry. The first structure, heterogeneous
unstructured, did not converge. Here we fit the second, heterogeneous
Toeplitz, which did converge.

``` r
ggplot(ADQS_PACC, aes(x=ADURW, y=PACC, color=TX)) +
  geom_line(aes(group = BID), alpha=0.2) +
  theme(legend.position = "inside", legend.position.inside = c(0.2, 0.2)) +
  xlab("Weeks since Randomization") +
  scale_x_continuous(breaks = seq(0, max(ADQS_PACC$ADURW), by = 24))
```

<div class="figure">

<img src="man/figures/README-pacc-spaghetti-plot-1.png" alt="Spaghetti plot of PACC data over time by treatment group." width="100%" />
<p class="caption">
Spaghetti plot of PACC data over time by treatment group.
</p>

</div>

``` r
# Spline basis expansion functions
# CAUTION: these function depend on the ADQS_PACC data frame object in the 
# global environment. If ADQS_PACC changes, so do these funtions
ns21 <- function(t){
  as.numeric(predict(splines::ns(ADQS_PACC$ADURW, df=2,
    Boundary.knots = c(0, max(ADQS_PACC$ADURW))), t)[,1])
}
ns22 <- function(t){
  as.numeric(predict(splines::ns(ADQS_PACC$ADURW, df=2,
    Boundary.knots = c(0, max(ADQS_PACC$ADURW))), t)[,2])
}

assign("ns21", ns21, envir = .GlobalEnv)
assign("ns22", ns22, envir = .GlobalEnv)

# GLS model fit:
pacc_fit <- gls(PACC ~ 
    I(ns21(ADURW)) + I(ns22(ADURW)) +
    (I(ns21(ADURW)) + I(ns22(ADURW))):TX + 
    AGEYR + AAPOEGNPRSNFLG + EDCCNTU + SUVRCER + QSVERSION,
  data = ADQS_PACC,
  weights = varIdent(form = ~ 1 | ASEQNCS),
  correlation = corARMA(form = ~ ASEQNCS | BID, p = 10))
```

``` r
ref_grid(pacc_fit,
  at = list(ADURW = c(0,240), TX = levels(ADQS_PACC$TX)),
  vcov. = clubSandwich::vcovCR(pacc_fit, type = "CR2") %>% as.matrix(),
  data = ADQS_PACC, 
  mode = "satterthwaite") %>%
  emmeans(~ ADURW | TX) %>%
  pairs(reverse = TRUE) %>%
  as_tibble() %>%
  mutate(p.value = formatp(p.value)) %>%
  kable(caption = "Mean PACC change from baseline at week 240 by treatment 
    group estimated from spline model.", digits = 2, booktabs = TRUE) %>%
  kableExtra::kable_styling(latex_options = "HOLD_position")
```

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>
Mean PACC change from baseline at week 240 by treatment group estimated
from spline model.
</caption>
<thead>
<tr>
<th style="text-align:left;">
contrast
</th>
<th style="text-align:left;">
TX
</th>
<th style="text-align:right;">
estimate
</th>
<th style="text-align:right;">
SE
</th>
<th style="text-align:right;">
df
</th>
<th style="text-align:right;">
t.ratio
</th>
<th style="text-align:left;">
p.value
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
ADURW240 - ADURW0
</td>
<td style="text-align:left;">
Placebo
</td>
<td style="text-align:right;">
-1.13
</td>
<td style="text-align:right;">
0.16
</td>
<td style="text-align:right;">
10775
</td>
<td style="text-align:right;">
-6.88
</td>
<td style="text-align:left;">
p\<0.001
</td>
</tr>
<tr>
<td style="text-align:left;">
ADURW240 - ADURW0
</td>
<td style="text-align:left;">
Solanezumab
</td>
<td style="text-align:right;">
-1.43
</td>
<td style="text-align:right;">
0.21
</td>
<td style="text-align:right;">
10775
</td>
<td style="text-align:right;">
-6.95
</td>
<td style="text-align:left;">
p\<0.001
</td>
</tr>
</tbody>
</table>

``` r
contrast240 <- ref_grid(pacc_fit, 
  at = list(ADURW = 240, TX = levels(ADQS_PACC$TX)),
  vcov. = clubSandwich::vcovCR(pacc_fit, type = "CR2") %>% as.matrix(), 
  data = ADQS_PACC, 
  mode = "satterthwaite") %>%
  emmeans(specs = "TX", by = "ADURW") %>%
  pairs(reverse = TRUE, adjust = "none")

contrast240 %>% 
  as_tibble() %>%
  left_join(contrast240 %>% 
      confint() %>%
      as_tibble() %>%
      select(contrast, lower.CL, upper.CL), by="contrast") %>%
  relocate(p.value, .after = last_col()) %>%
  mutate(p.value = formatp(p.value)) %>%
  kable(caption = "Mean PACC group change from baseline at week 240 by treatment 
    group estimated from spline model.", digits = 2, booktabs = TRUE) %>%
  kableExtra::kable_styling(latex_options = "HOLD_position")
```

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>
Mean PACC group change from baseline at week 240 by treatment group
estimated from spline model.
</caption>
<thead>
<tr>
<th style="text-align:left;">
contrast
</th>
<th style="text-align:right;">
ADURW
</th>
<th style="text-align:right;">
estimate
</th>
<th style="text-align:right;">
SE
</th>
<th style="text-align:right;">
df
</th>
<th style="text-align:right;">
t.ratio
</th>
<th style="text-align:right;">
lower.CL
</th>
<th style="text-align:right;">
upper.CL
</th>
<th style="text-align:left;">
p.value
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Solanezumab - Placebo
</td>
<td style="text-align:right;">
240
</td>
<td style="text-align:right;">
-0.3
</td>
<td style="text-align:right;">
0.26
</td>
<td style="text-align:right;">
10775
</td>
<td style="text-align:right;">
-1.14
</td>
<td style="text-align:right;">
-0.82
</td>
<td style="text-align:right;">
0.22
</td>
<td style="text-align:left;">
0.25
</td>
</tr>
</tbody>
</table>

``` r
ref_grid(pacc_fit, 
  at = list(ADURW = seq(0, 312, by=12), TX = levels(ADQS_PACC$TX)),
  vcov. = clubSandwich::vcovCR(pacc_fit, type = "CR2") %>% as.matrix(), 
  data = ADQS_PACC, 
  mode = "satterthwaite") %>%
  emmeans(specs = "TX", by = "ADURW") %>%
  as_tibble() %>%
  ggplot(aes(x=ADURW, y=emmean)) +
  geom_line(aes(color=TX)) +
  geom_ribbon(aes(ymin = lower.CL, ymax = upper.CL, fill = TX), alpha = 0.2) +
  scale_x_continuous(breaks = seq(0, 312, by=24)) +
  ylab("Mean PACC with 95% confidence intervals") +
  xlab("Weeks since Randomization") +
  theme(legend.position = 'inside', legend.position.inside = c(0.2, 0.2))
```

<div class="figure">

<img src="man/figures/README-pacc-mean-plot-1.png" alt="Mean PACC per treatment group over time as estimated by spline model. Shaded region depicts 95% confidence intervals." width="100%" />
<p class="caption">
Mean PACC per treatment group over time as estimated by spline model.
Shaded region depicts 95% confidence intervals.
</p>

</div>

## References

Donohue, Michael C, Oliver Langford, Philip S Insel, Christopher H van
Dyck, Ronald C Petersen, Suzanne Craft, Gopalan Sethuraman, Rema Raman,
Paul S Aisen, and Alzheimer’s Disease Neuroimaging Initiative. 2023.
“Natural Cubic Splines for the Analysis of Alzheimer’s Clinical Trials.”
*Pharmaceutical Statistics* 22 (3): 508–19.

Donohue, Michael C, Reisa A Sperling, David P Salmon, Dorene M Rentz,
Rema Raman, Ronald G Thomas, Michael Weiner, Paul S Aisen, et al. 2014.
“The Preclinical Alzheimer Cognitive Composite: Measuring
Amyloid-Related Decline.” JAMA Neurology 71 (8): 961–70. R Core Team.
2019. R: A Language and Environment for Statistical Computing. Vienna,
Austria: R Foundation for Statistical Computing.
<https://www.R-project.org>.

Sperling, Reisa A, Michael C Donohue, Rema Raman, Michael S Rafii, Keith
Johnson, Colin L Masters, Christopher H van Dyck, et al. 2023. “Trial of
Solanezumab in Preclinical Alzheimer’s Disease.” *New England Journal of
Medicine* 389 (12): 1096–1107.
