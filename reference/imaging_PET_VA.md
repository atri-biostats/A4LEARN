# imaging_PET_VA: Imaging - Amyloid PET Qualitative Visual Assessment

ATRI external analysis dataset.

## Usage

``` r
data(imaging_PET_VA)
```

## Format

A data frame with 4492 rows and 12 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- scan_number: Scan number from PET Acquisition document

- VISCODE: NA

- scan_date_DAYS_CONSENT: NA (Derived to days since study consent date)

- scan_date_DAYS_T0: NA (Derived to days since study start date \[A4:
  Ranomization date \| LEARN: Baseline registry exam date\])

- ligand: Ligand

- pmod_suvr: Composite_Summary value

- elig_vi_1: Reader 1 eligibility assessment score

- elig_vi_2: Reader 2 eligibility assessment score

- consensus: Consensus result

- overall_score: Indication whether the eligibility scan is positive or
  negative for β‐amyloid. Score of negative indicates subject is not
  eligible

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
