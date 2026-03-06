# cdr: Clinical Dementia Rating

ATRI clinical analysis dataset.

## Usage

``` r
data(cdr)
```

## Format

A data frame with 15511 rows and 25 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- DONE: Was assessment/procedure done?

- NDREASON: If No, reason not done:

- CDSPVERS: Version

- CDPTSRCE: Participant

- CDSPSRCE: Study Partner

- BPID: Study Partner ID:

- MEMORY: Memory Score

- ORIENT: Orientation Score

- JUDGE: Judgment and Problem Solving Score

- COMMUN: Community Affairs Score

- HOME: Home and Hobbies Score

- CARE: Personal Care Score

- CDSOB: Sum of Boxes (system populated)

- CDGLOBAL: Global CDR (system populated)

- AVISIT: Analysis visit.

- CDADTC_DAYS_CONSENT: Analysis date of CDR registry.EXAMDATE, if it
  exists, otherwise manually reviewed
  missing_pacc_dates_verify.EXAMDATE.verify (Derived to days since study
  consent date)

- CDADTC_DAYS_T0: Analysis date of CDR registry.EXAMDATE, if it exists,
  otherwise manually reviewed missing_pacc_dates_verify.EXAMDATE.verify
  (Derived to days since study start date \[A4: Ranomization date \|
  LEARN: Baseline registry exam date\])

- EPOCH: Epoch.

- CDDY: Study day of CDR collection, measured as integer days.

- CDEVENT: CDR-Global progression event defined as two consecutive
  CDR-Global scores in the placebo-controlled phase greater than zero,
  or a final observed CDR-Global score in the placebo-controlled phase
  greater than zero. The time of the event will be considered the time
  from baseline (in days) from randomization to the first of two
  consecutive CDR-Global scores greater than zero, or to final observed
  CDR-Global score greater than zero. If a participant has only
  CDR-Global scores of zero at every visit, the censoring time will be
  the time of the last observed CDR-Global score in the
  placebo-controlled phase.

- CDOLEEVENT: OLE CDR-Global progression event defined as two
  consecutive CDR-Global scores in the placebo-controlled or OLE phase
  greater than zero, or a final observed CDR-Global score in the
  placebo-controlled or OLE phase greater than zero. The time of the
  event will be considered the time from baseline (in days) to the first
  of two consecutive CDR-Global scores greater than zero, or to final
  observed CDR-Global score greater than zero. If a participant has only
  CDR-Global scores of zero at every visit, the censoring time will be
  the time of the last observed CDR-Global score in either
  placebo-controlled or OLE phase.

- CDRSB: CDR Sum of Boxes score with proration for missing box scores if
  percent missing is \<= 30

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
