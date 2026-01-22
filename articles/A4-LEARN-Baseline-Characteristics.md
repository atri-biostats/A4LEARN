# A4 and LEARN Screening and Baseline

The *Anti-Amyloid Treatment in Asymptomatic Alzheimer’s Disease (A4)*
study was a Phase 3, double-blind, placebo-controlled study of
solanezumab in subjects with preclinical Alzheimer’s Disease (Sperling
et al. 2023). The *Longitudinal Evaluation of Amyloid Risk and
Neurodegeneration (LEARN)* study enrolled clinically unimpaired
individuals who screen-failed for the A4 Study on the basis of not
showing elevated amyloid on screening amyloid PET imaging and followed
them longitudinally with all of the same assessments as A4.

The code below demonstrates how to reproduce Table 1 from Sperling et
al. (2020) using data in the `A4LEARN` package and R Core Team (2024).

## Load required R packages

``` r

library(tidyverse)
library(arsenal)
library(A4LEARN)
```

## Prepare data

**Rescreens**

Participants who re-screened may appear in the data twice with different
BIDs each time. The
[`A4LEARN::SUBJINFO`](https://atri-biostats.github.io/A4LEARN/reference/SUBJINFO.html)
derived dataset indicates which participants are re-screens, and how the
re-screen BIDs are mapped to each other. The code below also accounts
for this to set up the removal of duplicate appearances.

``` r

rescreens <- A4LEARN::SUBJINFO %>%
  filter(!is.na(PREVBID)) %>%
  rename(BID1 = PREVBID, BID2 = BID) %>%
  select(BID1, BID2)
```

**Gather Amyloid PET data**

The Amyloid PET quantitative data
([`A4LEARN::imaging_SUVR_amyloid`](https://atri-biostats.github.io/A4LEARN/reference/imaging_SUVR_amyloid.html))
is in long format with one row per region. We use
[`tidyr::pivot_wider`](https://tidyr.tidyverse.org/reference/pivot_wider.html)
to transform to wide format with one column per region.

``` r

pet <- A4LEARN::imaging_SUVR_amyloid %>% 
  filter(brain_region != '' & VISCODE == 2) %>%
  pivot_wider(id_cols='BID', names_from=brain_region, values_from=suvr_cer) %>%
  left_join(A4LEARN::imaging_PET_VA, by='BID') %>%
  left_join(rescreens, by=c('BID' = 'BID1')) %>% 
  mutate( # update PET BIDs to second BID if necessary
    BID = case_when(
      !is.na(BID2) ~ BID2,
      TRUE ~ BID)) %>%
  arrange(BID, BID2) %>%
  filter(!duplicated(BID, fromLast = TRUE)) %>%
  select(-BID2)
```

**Baseline PACC**

``` r

pacc_bl <- A4LEARN::PACC %>% 
  filter(VISCODE == 6) %>%
  select(BID, PACC.raw, MMSCORE, LDELTOTAL, DIGITTOTAL, FCTOTAL96)
```

**Prepare data table**

``` r

dd <- A4LEARN::SUBJINFO %>% select(BID, APOEGN) %>%
  left_join(A4LEARN::ptdemog, by='BID') %>%
  left_join(pet, by=c('SUBSTUDY','BID')) %>%
  left_join(pacc_bl, by=c('BID')) %>%
  # remove first appearance of rescreens:
  filter(!BID %in% rescreens$BID1) %>% 
  rename(`A4 amyloid eligibility` = overall_score) %>%
  rename(
    `Age at screening (yrs)` = PTAGE,
    `APOE genotype` = APOEGN, 
    `Education (yrs)` = PTEDUCAT, 
    `Amyloid PET SUVr^b^` = Composite_Summary,
    Sex = PTGENDER,
    Ethnicity = PTETHNIC,
    `Marital status` = PTMARRY,
    `Participant retired` = PTNOTRT,
    PACC = PACC.raw, 
    MMSE = MMSCORE, 
    `Logical memory delay` = LDELTOTAL, 
    `Digit symbol` = DIGITTOTAL, 
    `FCSRT (2xFree + Cued)` = FCTOTAL96,
    `A4 amyloid eligibility^b^` = `A4 amyloid eligibility`) %>% 
  # rename values and fields for footnote setup in summary table
  mutate(SUBSTUDY = factor(SUBSTUDY, levels = c('A4', 'LEARN'),
    labels = c('A4^a^' , 'LEARN')))
```

## Characteristics by screening amyloid PET status

``` r

tableby(`A4 amyloid eligibility^b^` ~ .,
  data = dd %>%
    filter(!is.na(`Amyloid PET SUVr^b^`)) %>%
    select(`A4 amyloid eligibility^b^`, `Age at screening (yrs)`, 
      `Education (yrs)`, `APOE genotype`, `Amyloid PET SUVr^b^`, 
      Sex, Ethnicity, `Marital status`, `Participant retired`, PACC, MMSE, 
      `Logical memory delay`, `Digit symbol`, `FCSRT (2xFree + Cued)`), 
  digits = 2) %>%
  summary(title = "Characteristics of all who underwent screening amyloid PET with comparison of Not Elevated (Aβ−) and Elevated Amyloid (Aβ+) groups")
```

|  | Negative (N=3163) | Positive (N=1323) | Total (N=4486) | p value |
|:---|:--:|:--:|:--:|---:|
| **Age at screening (yrs)** |  |  |  | \< 0.001 |
|    Mean (SD) | 70.95 (4.53) | 72.10 (4.89) | 71.29 (4.67) |  |
|    Range | 64.63 - 85.93 | 65.00 - 85.74 | 64.63 - 85.93 |  |
| **Education (yrs)** |  |  |  | 0.535 |
|    N-Miss | 4 | 2 | 6 |  |
|    Mean (SD) | 16.60 (2.85) | 16.54 (2.81) | 16.58 (2.84) |  |
|    Range | 8.00 - 32.00 | 7.00 - 30.00 | 7.00 - 32.00 |  |
| **APOE genotype** |  |  |  | \< 0.001 |
|    N-Miss | 30 | 2 | 32 |  |
|    E2/E2 | 23 (0.7%) | 2 (0.2%) | 25 (0.6%) |  |
|    E2/E3 | 380 (12.1%) | 69 (5.2%) | 449 (10.1%) |  |
|    E2/E4 | 74 (2.4%) | 42 (3.2%) | 116 (2.6%) |  |
|    E3/E3 | 1938 (61.9%) | 482 (36.5%) | 2420 (54.3%) |  |
|    E3/E4 | 684 (21.8%) | 618 (46.8%) | 1302 (29.2%) |  |
|    E4/E4 | 34 (1.1%) | 108 (8.2%) | 142 (3.2%) |  |
| **Amyloid PET SUVr^(b)** |  |  |  | \< 0.001 |
|    Mean (SD) | 0.99 (0.07) | 1.33 (0.18) | 1.09 (0.19) |  |
|    Range | 0.70 - 1.59 | 0.97 - 2.09 | 0.70 - 2.09 |  |
| **Sex** |  |  |  | 0.623 |
|    Male | 1278 (40.4%) | 545 (41.2%) | 1823 (40.6%) |  |
|    Female | 1885 (59.6%) | 778 (58.8%) | 2663 (59.4%) |  |
| **Ethnicity** |  |  |  | 0.193 |
|    Hispanic or Latino | 103 (3.3%) | 39 (2.9%) | 142 (3.2%) |  |
|    Not Hispanic or Latino | 3040 (96.1%) | 1269 (95.9%) | 4309 (96.1%) |  |
|    Unknown or Not reported | 20 (0.6%) | 15 (1.1%) | 35 (0.8%) |  |
| **Marital status** |  |  |  | 0.635 |
|    Married | 2223 (70.3%) | 943 (71.3%) | 3166 (70.6%) |  |
|    Widowed | 304 (9.6%) | 122 (9.2%) | 426 (9.5%) |  |
|    Divorced | 438 (13.8%) | 190 (14.4%) | 628 (14.0%) |  |
|    Never married | 135 (4.3%) | 48 (3.6%) | 183 (4.1%) |  |
|    Unknown/Other | 63 (2.0%) | 20 (1.5%) | 83 (1.9%) |  |
| **Participant retired** |  |  |  | 0.942 |
|    N-Miss | 1 | 0 | 1 |  |
|    Yes | 2396 (75.8%) | 1005 (76.0%) | 3401 (75.8%) |  |
|    No | 724 (22.9%) | 299 (22.6%) | 1023 (22.8%) |  |
|    Not Applicable | 42 (1.3%) | 19 (1.4%) | 61 (1.4%) |  |
| **PACC** |  |  |  | \< 0.001 |
|    N-Miss | 2625 | 151 | 2776 |  |
|    Mean (SD) | 0.79 (2.35) | -0.00 (2.68) | 0.25 (2.60) |  |
|    Range | -8.70 - 6.64 | -12.52 - 7.75 | -12.52 - 7.75 |  |
| **MMSE** |  |  |  | \< 0.001 |
|    N-Miss | 2625 | 151 | 2776 |  |
|    Mean (SD) | 29.03 (1.17) | 28.78 (1.28) | 28.86 (1.25) |  |
|    Range | 23.00 - 30.00 | 22.00 - 30.00 | 22.00 - 30.00 |  |
| **Logical memory delay** |  |  |  | \< 0.001 |
|    N-Miss | 2625 | 151 | 2776 |  |
|    Mean (SD) | 13.54 (3.35) | 12.62 (3.68) | 12.91 (3.60) |  |
|    Range | 3.00 - 24.00 | 0.00 - 23.00 | 0.00 - 24.00 |  |
| **Digit symbol** |  |  |  | 0.010 |
|    N-Miss | 2625 | 151 | 2776 |  |
|    Mean (SD) | 49.97 (9.89) | 48.64 (10.02) | 49.06 (9.99) |  |
|    Range | 0.00 - 79.00 | 15.00 - 86.00 | 0.00 - 86.00 |  |
| **FCSRT (2xFree + Cued)** |  |  |  | \< 0.001 |
|    N-Miss | 2625 | 151 | 2776 |  |
|    Mean (SD) | 78.67 (5.83) | 77.33 (6.29) | 77.76 (6.18) |  |
|    Range | 58.00 - 94.00 | 44.00 - 92.00 | 44.00 - 94.00 |  |

Characteristics of all who underwent screening amyloid PET with
comparison of Not Elevated (Aβ−) and Elevated Amyloid (Aβ+) groups
{.table}

## Characteristics by A4 vs LEARN

``` r

tableby(SUBSTUDY ~ .,
  data = dd %>%
    filter(!SUBSTUDY %in% 'SF') %>% # excluding screen-fails
    select(SUBSTUDY, `A4 amyloid eligibility^b^`, `Age at screening (yrs)`, 
      `Education (yrs)`, `APOE genotype`, `Amyloid PET SUVr^b^`, Sex, Ethnicity,
      `Marital status`, `Participant retired`, PACC, MMSE, 
      `Logical memory delay`, `Digit symbol`, `FCSRT (2xFree + Cued)`), 
  digits = 2) %>%
  summary(title = "Baseline characteristics of A4-randomized^a^ and LEARN-enrolled cohorts")
```

|  | A4^(a) (N=1169) | LEARN (N=538) | Total (N=1707) | p value |
|:---|:--:|:--:|:--:|---:|
| **A4 amyloid eligibility^(b)** |  |  |  | \< 0.001 |
|    Negative | 0 (0.0%) | 538 (100.0%) | 538 (31.5%) |  |
|    Positive | 1169 (100.0%) | 0 (0.0%) | 1169 (68.5%) |  |
| **Age at screening (yrs)** |  |  |  | \< 0.001 |
|    Mean (SD) | 71.92 (4.81) | 70.53 (4.32) | 71.48 (4.71) |  |
|    Range | 65.00 - 85.74 | 65.00 - 85.60 | 65.00 - 85.74 |  |
| **Education (yrs)** |  |  |  | 0.127 |
|    Mean (SD) | 16.57 (2.81) | 16.79 (2.63) | 16.64 (2.76) |  |
|    Range | 7.00 - 30.00 | 8.00 - 30.00 | 7.00 - 30.00 |  |
| **APOE genotype** |  |  |  | \< 0.001 |
|    N-Miss | 0 | 2 | 2 |  |
|    E2/E2 | 2 (0.2%) | 5 (0.9%) | 7 (0.4%) |  |
|    E2/E3 | 61 (5.2%) | 66 (12.3%) | 127 (7.4%) |  |
|    E2/E4 | 35 (3.0%) | 10 (1.9%) | 45 (2.6%) |  |
|    E3/E3 | 417 (35.7%) | 342 (63.8%) | 759 (44.5%) |  |
|    E3/E4 | 560 (47.9%) | 111 (20.7%) | 671 (39.4%) |  |
|    E4/E4 | 94 (8.0%) | 2 (0.4%) | 96 (5.6%) |  |
| **Amyloid PET SUVr^(b)** |  |  |  | \< 0.001 |
|    Mean (SD) | 1.33 (0.18) | 0.99 (0.07) | 1.22 (0.22) |  |
|    Range | 0.97 - 2.09 | 0.79 - 1.16 | 0.79 - 2.09 |  |
| **Sex** |  |  |  | 0.440 |
|    Male | 475 (40.6%) | 208 (38.7%) | 683 (40.0%) |  |
|    Female | 694 (59.4%) | 330 (61.3%) | 1024 (60.0%) |  |
| **Ethnicity** |  |  |  | 0.820 |
|    Hispanic or Latino | 34 (2.9%) | 18 (3.3%) | 52 (3.0%) |  |
|    Not Hispanic or Latino | 1124 (96.2%) | 516 (95.9%) | 1640 (96.1%) |  |
|    Unknown or Not reported | 11 (0.9%) | 4 (0.7%) | 15 (0.9%) |  |
| **Marital status** |  |  |  | 0.164 |
|    Married | 836 (71.5%) | 386 (71.7%) | 1222 (71.6%) |  |
|    Widowed | 102 (8.7%) | 52 (9.7%) | 154 (9.0%) |  |
|    Divorced | 170 (14.5%) | 67 (12.5%) | 237 (13.9%) |  |
|    Never married | 42 (3.6%) | 29 (5.4%) | 71 (4.2%) |  |
|    Unknown/Other | 19 (1.6%) | 4 (0.7%) | 23 (1.3%) |  |
| **Participant retired** |  |  |  | 0.702 |
|    Yes | 877 (75.0%) | 411 (76.4%) | 1288 (75.5%) |  |
|    No | 274 (23.4%) | 121 (22.5%) | 395 (23.1%) |  |
|    Not Applicable | 18 (1.5%) | 6 (1.1%) | 24 (1.4%) |  |
| **PACC** |  |  |  | \< 0.001 |
|    Mean (SD) | -0.00 (2.68) | 0.79 (2.35) | 0.25 (2.61) |  |
|    Range | -12.52 - 7.75 | -8.70 - 6.64 | -12.52 - 7.75 |  |
| **MMSE** |  |  |  | \< 0.001 |
|    Mean (SD) | 28.78 (1.28) | 29.03 (1.17) | 28.86 (1.25) |  |
|    Range | 22.00 - 30.00 | 23.00 - 30.00 | 22.00 - 30.00 |  |
| **Logical memory delay** |  |  |  | \< 0.001 |
|    Mean (SD) | 12.62 (3.68) | 13.54 (3.35) | 12.91 (3.61) |  |
|    Range | 0.00 - 23.00 | 3.00 - 24.00 | 0.00 - 24.00 |  |
| **Digit symbol** |  |  |  | 0.011 |
|    Mean (SD) | 48.64 (10.02) | 49.97 (9.89) | 49.06 (10.00) |  |
|    Range | 15.00 - 86.00 | 0.00 - 79.00 | 0.00 - 86.00 |  |
| **FCSRT (2xFree + Cued)** |  |  |  | \< 0.001 |
|    Mean (SD) | 77.35 (6.29) | 78.67 (5.83) | 77.77 (6.18) |  |
|    Range | 44.00 - 92.00 | 58.00 - 94.00 | 44.00 - 94.00 |  |

Baseline characteristics of A4-randomized^(a) and LEARN-enrolled cohorts
{.table}

^(a) A4-randomized cohort (n=1169) includes other participants in
addition to the modified intention-to-treat population (mITT n=1147)
reported in the A4 trial (Sperling et al. 2023). The modified
intention-to-treat population population that was reported for the A4
trial results include those who received at least one dose of
solanezumab or placebo and underwent assessment for the primary end
point. Please refer to the
[`vignette(topic = 'A4-Primary-Results')`](https://atri-biostats.github.io/A4LEARN/articles/A4-Primary-Results.md)
file for code to reproduce the baseline characteristics and primary
findings of the A4 study.  
^(b) Refer to A4 Amyloid PET Eligibility Methods PDF document
(`vignette(topic = 'imaging_PET_VA_methods')`) regarding these
amyloid-related measures, the eligibility determination process and the
modifications made to the SUVR algorithm.

## References

R Core Team. 2024. *R: A Language and Environment for Statistical
Computing*. R Foundation for Statistical Computing.
<https://www.R-project.org/>.

Sperling, Reisa A, Michael C Donohue, Rema Raman, et al. 2020.
“Association of Factors with Elevated Amyloid Burden in Clinically
Normal Older Individuals.” *JAMA Neurology* 77 (6): 735–45.
<https://doi.org/10.1001/jamaneurol.2020.0387>.

Sperling, Reisa A, Michael C Donohue, Rema Raman, et al. 2023. “Trial of
Solanezumab in Preclinical Alzheimer’s Disease.” *New England Journal of
Medicine* 389 (12): 1096–107. <https://doi.org/10.1056/NEJMoa2305032>.
