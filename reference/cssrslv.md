# cssrslv: C-SSRS - Since Last Visit

ATRI clinical analysis dataset.

## Usage

``` r
data(cssrslv)
```

## Format

A data frame with 18851 rows and 30 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- DONE: Was assessment/procedure done?

- NDREASON: If No, reason not done:

- WISHLV: \<big header\>Suicidal Ideation\</big header\>\<br\>\<br/\>1.
  Wish to be Dead - Since Last Visit

- ACTLV: 2. Non-Specific Active Suicidal Thoughts - Since Last Visit

- METHODLV: 3. Active Suicidal Ideation with Any Methods (Not Plan)
  without Intent to Act - Since Last Visit

- INTENTLV: 4. Active Suicidal Ideation with Some Intent to Act, without
  Specific Plan - Since Last Visit

- PLANLV: 5. Active Suicidal Ideation with Specific Plan and Intent -
  Since Last Visit

- SEVLV: \<big header\>Intensity of Ideation\</big
  header\>\<br\>\<br/\>Most Severe Ideation - Since last visit

- FREQLV: Frequency: Most Severe - Since Last Visit

- DURATLV: Duration: Most Severe - Since Last Visit

- CONTROLLV: Controllability: Most Severe - Since Last Visit

- DETERLV: Deterrents: Most Severe - Since Last Visit

- REASONLV: Reasons for Ideation: Most Severe - Since Last Visit

- ATTMPTLV: Actual Attempt - Since Last Visit

- ATTMLVN: Total number of actual attempts

- NONSUILV: Has subject engaged in Non-Suicidal Self-Injurious
  Behavior - Since Last Visit?

- INTERLV: Interrupted Attempt - Since Last Visit

- INTERLVN: Total number of interrupted attempts

- ABORTLV: Aborted Attempt - Since Last Visit

- ABORTLVN: Total number of aborted attempts

- PREPLV: Preparatory Acts or Behavior - Since Last Visit

- PRESENTLV: Suicidal Behavior - Since Last Visit

- SUICIDE: Suicide - Since Last Visit

- LETHALLV_DAYS_CONSENT: Most Lethal Attempt Date - Since Last Visit
  (Derived to days since study consent date)

- LETHALLV_DAYS_T0: Most Lethal Attempt Date - Since Last Visit (Derived
  to days since study start date \[A4: Ranomization date \| LEARN:
  Baseline registry exam date\])

- RECLVDAM: Actual Lethality/Medical Damage

- RECLVPOT: Potential Lethality

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
