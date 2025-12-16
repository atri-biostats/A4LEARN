# ptdemog: Participant Demographics

ATRI clinical analysis dataset.

## Usage

``` r
data(ptdemog)
```

## Format

A data frame with 6945 rows and 21 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- EXAMDATE_DAYS_CONSENT: Examination Date (Derived to days since study
  consent date)

- EXAMDATE_DAYS_T0: Examination Date (Derived to days since study start
  date \[A4: Ranomization date \| LEARN: Baseline registry exam date\])

- PTGENDER: Gender

- PTAGE: Age at Screening Visit

- PTETHNIC: Ethnic Category

- PTRACE: Racial Categories

- PTLANG: Language to be used for testing (only one may be checked and
  must remain the same throughout the study)

- PTPLANG: Is language to be used for testing the same as primary
  language?

- PTEDUCAT: Education (years)

- PTMARRY: Marital Status

- PTNOTRT: Participant Retired?

- PTHOME: Type of Residence

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
