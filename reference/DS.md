# DS: \[Derived\] Disposition

ATRI derived analysis dataset.

## Usage

``` r
data(DS)
```

## Format

A data frame with 16262 rows and 9 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- DSSEQ: Sequence Number given to ensure uniqueness of subject records
  within a domain. May be any valid number.

- DSDECOD: Modified Intent-to-Treat Flag, randomized subjects who have a
  baseline observation and at least one post-baseline observation = 1,
  others = 0

- DSCAT: Used to define a category of related records. DSCAT is now an
  “Expected” variable. DSCAT was permissible in SDTMIG 3.1.1 and earlier
  versions. The change from “permissible” to “expected” is based on the
  requirement to distinguish protocol milestones and/or other events
  from disposition events. DSCAT may be null if there are only
  “disposition events”; however, it is recommended that DSCAT always be
  populated.

- EPOCH: Epoch

- DSSTDTC_DAYS_CONSENT: Disposition Start Date (Derived to days since
  study consent date)

- DSSTDTC_DAYS_T0: Disposition Start Date (Derived to days since study
  start date \[A4: Ranomization date \| LEARN: Baseline registry exam
  date\])

- DSSTDY: Study day of start of event relative to the sponsor-defined
  RFSTDTC

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
