# COGSTATE_COMPUTERIZED: \[Derived\] Cogstate (Computerized)

ATRI derived analysis dataset.

## Usage

``` r
data(COGSTATE_COMPUTERIZED)
```

## Format

A data frame with 315596 rows and 14 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- TESTDATE_DAYS_CONSENT: Test Date (Derived to days since study consent
  date)

- TESTDATE_DAYS_T0: Test Date (Derived to days since study start date
  \[A4: Ranomization date \| LEARN: Baseline registry exam date\])

- VISIT: Visit number in original cogstate_computerized

- AVISIT: Analysis Visit

- TESTCD: Computerized test name

- VALUE: Score

- TRIAL: Number of trial for binomial outcomes

- BASELINE.VALUE: Baseline Score

- BASELINE.TRIAL: Baseline TRIAL

- VALUE.DIF: Change from score

- EPOCH: Epoch

- ADURW: Study Week of Finding

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
