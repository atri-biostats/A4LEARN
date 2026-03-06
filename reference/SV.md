# SV: \[Derived\] Subject Visits

ATRI derived analysis dataset.

## Usage

``` r
data(SV)
```

## Format

A data frame with 103351 rows and 9 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISITCD: Visit Code

- VISIT: Visit

- SVSTDTC_DAYS_CONSENT: Start date/time for a Visit (Derived to days
  since study consent date)

- SVSTDTC_DAYS_T0: Start date/time for a Visit (Derived to days since
  study start date \[A4: Ranomization date \| LEARN: Baseline registry
  exam date\])

- SVTYPE: Visit Type: What type of visit was conducted? Standard,
  Nonstandard, Not Done

- SVUSEDTC_DAYS_CONSENT: End date/time for a Visit (Derived to days
  since study consent date)

- SVUSEDTC_DAYS_T0: End date/time for a Visit (Derived to days since
  study start date \[A4: Ranomization date \| LEARN: Baseline registry
  exam date\])

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
