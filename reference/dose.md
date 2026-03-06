# dose: Study Drug Therapy

ATRI clinical analysis dataset.

## Usage

``` r
data(dose)
```

## Format

A data frame with 75241 rows and 16 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- DONE: Was assessment/procedure done?

- NDREASON: If No, reason not done:

- LOCATION: Where was infusion administered?

- VOLUME: Volume of treatment solution administered

- STARTDATE_DAYS_CONSENT: Treatment Start Date (Derived to days since
  study consent date)

- STARTDATE_DAYS_T0: Treatment Start Date (Derived to days since study
  start date \[A4: Ranomization date \| LEARN: Baseline registry exam
  date\])

- ENDDATE_DAYS_CONSENT: Treatment End Date (Derived to days since study
  consent date)

- ENDDATE_DAYS_T0: Treatment End Date (Derived to days since study start
  date \[A4: Ranomization date \| LEARN: Baseline registry exam date\])

- COMPLETE: Describe infusion for this time point:

- ATTEMPTNUM: Total number of attempts:

- DOSELEVEL: Dose Prescribed

- BLINDDOSE: Blinded dose of solanezumab or placebo in mg administered
  at the visit

- BLINDCUMDOSE: Blinded cumulative dose of solanezumab or placebo in mg
  administered at the visit and prior visits.

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
