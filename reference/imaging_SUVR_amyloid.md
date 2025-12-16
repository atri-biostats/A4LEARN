# imaging_SUVR_amyloid: Imaging - Amyloid PET SUVR Quantitative Analysis

ATRI external analysis dataset.

## Usage

``` r
data(imaging_SUVR_amyloid)
```

## Format

A data frame with 45967 rows and 12 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- scan_number: Scan number from PET Acquisition document

- VISCODE: NA

- scan_date_DAYS_CONSENT: NA (Derived to days since study consent date)

- scan_date_DAYS_T0: NA (Derived to days since study start date \[A4:
  Ranomization date \| LEARN: Baseline registry exam date\])

- ligand: Ligand

- scan_analyzed: Was the scan able to be analyzed?

- brain_region: Region of interest

- suvr_cer: Standard Uptake Value Ratio (blcere_all)

- suvr_persi: Standard uptake value ratio (persi white matter)

- suvr_crus: Standard uptake value ratio (cerebellar crus)

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
