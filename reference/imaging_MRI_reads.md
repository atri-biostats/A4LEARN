# imaging_MRI_reads: Imaging - MRI Read Results

ATRI external analysis dataset.

## Usage

``` r
data(imaging_MRI_reads)
```

## Format

A data frame with 1797 rows and 9 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- STUDYDATE_DAYS_CONSENT: Study MRI Date (Derived to days since study
  consent date)

- STUDYDATE_DAYS_T0: Study MRI Date (Derived to days since study start
  date \[A4: Ranomization date \| LEARN: Baseline registry exam date\])

- Definite.MCH: Total Definite Microhemorrhage

- Lobar: Total Lobar Microhemorrhage

- Deep: Total Deep (Subcortical) Microhemorrhage

- Definite.SS: Definite Superficial Siderosis

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
