# biomarker_pTau217: Biomarker - pTau-217 Digital Immunoassay

ATRI external analysis dataset.

## Usage

``` r
data(biomarker_pTau217)
```

## Format

A data frame with 4538 rows and 18 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- SAMPLE_ID: Sample Identifier

- TESTCD: Short Name of Lab Test

- TEST: Name of Lab Test

- ORRES: Lab Result

- ORRESU: Lab Results Units

- STAT: Completion Status

- REASND: Reason Not Done

- NAM: Laboratory Name

- SPEC: Specimen Material Type

- METHOD: Method Code for Test

- COLLECTION_DATE_DAYS_CONSENT: Date Specimen Collection (Derived to
  days since study consent date)

- COLLECTION_DATE_DAYS_T0: Date Specimen Collection (Derived to days
  since study start date \[A4: Ranomization date \| LEARN: Baseline
  registry exam date\])

- COMMENT: Comments if relevant to result

- ORRESRAW: Lab Result (raw value)

- COMMENT2: Comments if relevant to result

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
