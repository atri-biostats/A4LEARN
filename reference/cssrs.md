# cssrs: C-SSRS - Baseline/Screening Version

ATRI clinical analysis dataset.

## Usage

``` r
data(cssrs)
```

## Format

A data frame with 5660 rows and 55 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- WISHLIFE: Lifetime \<!–1. Wish to be Dead–\>

- WISH3: In the past 3 months \<!–1. Wish to be Dead–\>

- ACTLIFE: Lifetime \<!–2. Non-Specific Active Suicidal Thoughts–\>

- ACT3: In the past 3 months \<!–2. Non-Specific Active Suicidal
  Thoughts–\>

- METHOD: Lifetime \<!–3. Active Suicidal Ideation with Any Methods (Not
  Plan) without Intent to Act–\>

- METHOD3: In the past 3 months \<!–3. Active Suicidal Ideation with Any
  Methods (Not Plan) without Intent to Act–\>

- INTENT: Lifetime \<!–4. Active Suicidal Ideation with Some Intent to
  Act, without Specific Plan–\>

- INTENT3: In the past 3 months \<!–4. Active Suicidal Ideation with
  Some Intent to Act, without Specific Plan–\>

- PLAN: Lifetime \<!–5. Active Suicidal Ideation with Specific Plan and
  Intent–\>

- PLAN3: In the past 3 months \<!–5. Active Suicidal Ideation with
  Specific Plan and Intent–\>

- SEVLIFE: \<big header\>Intensity of Ideation\</big header\>\<br
  /\>Lifetime - Most Severe Ideation

- SEV3: Past 3 months - Most Severe Ideation

- FREQLIF: Frequency: Most Severe - Lifetime

- FREQCUR: Frequency: Most Severe - Past 3 months

- DURATLIF: Duration: Most Severe - Lifetime

- DURATCUR: Duration: Most Severe - Past 3 months

- CONTROLLIF: Controllability: Most Severe - Lifetime

- CONTROLCUR: Controllability: Most Severe - Past 3 months

- DETERLIF: Deterrents: Most Severe - Lifetime

- DETERCUR: Deterrents: Most Severe - Past 3 months

- REASONLIF: Reasons for Ideation: Most Severe - Lifetime

- REASONCUR: Reasons for Ideation: Most Severe - Past 3 months

- ATTMPT: Actual Attempt: Lifetime

- ATTMPT5: Actual Attempt: Past 5 years

- ATTMPTN: Total number of actual attempts - Lifetime

- ATTMPT5N: Total number of actual attempts - Past 5 years

- NONSUI: Lifetime\<!–Has subject engaged in Non-Suicidal Self-Injurious
  Behavior?–\>

- NONSUI5: Past 5 years\<!–Has subject engaged in Non-Suicidal
  Self-Injurious Behavior?–\>

- INTER: Interrupted Attempt - Lifetime

- INTER5: Interrupted Attempt - Past 5 years

- INTERN: Total number of interrupted - Lifetime

- INTER5N: Total number of interrupted - Past 5 years

- ABORT: Aborted Attempt - Lifetime

- ABORT5: Aborted Attempt - Past 5 years

- ABORTN: Total number of aborted - Lifetime

- ABORT5N: Total number of aborted - Past 5 years

- PREP: Preparatory Acts or Behavior - Lifetime

- PREP5: Preparatory Acts or Behavior - Past 5 years

- BEHAVLIF: Suicidal Behavior - Lifetime

- BEHAVREC: Suicidal Behavior - Past 5 years

- RECENT_DAYS_CONSENT: Most Recent Attempt Date (Derived to days since
  study consent date)

- RECENT_DAYS_T0: Most Recent Attempt Date (Derived to days since study
  start date \[A4: Ranomization date \| LEARN: Baseline registry exam
  date\])

- RECENTDAM: Actual Lethality/Medical Damage\<!–Most Recent Attempt
  Date–\>

- RECENTPOT: Potential Lethality\<!–Most Recent Attempt Date–\>

- LETHAL_DAYS_CONSENT: Most Lethal Attempt Date (Derived to days since
  study consent date)

- LETHAL_DAYS_T0: Most Lethal Attempt Date (Derived to days since study
  start date \[A4: Ranomization date \| LEARN: Baseline registry exam
  date\])

- LETHALDAM: Actual Lethality/Medical Damage\<!–Most Lethal Attempt
  Date–\>

- LETHALPOT: Potential Lethality\<!–Most Lethal Attempt Date–\>

- FIRST_DAYS_CONSENT: Initial/First Attempt date (Derived to days since
  study consent date)

- FIRST_DAYS_T0: Initial/First Attempt date (Derived to days since study
  start date \[A4: Ranomization date \| LEARN: Baseline registry exam
  date\])

- FIRSTDAM: Actual Lethality/Medical Damage\<!–Initial/First Attempt
  Date–\>

- FIRSTPOT: Potential Lethality\<!–Initial/First Attempt Date–\>

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
