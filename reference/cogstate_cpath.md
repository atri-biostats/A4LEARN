# cogstate_cpath: Cogstate - Critical Path Institute: Activities of Daily Living

ATRI external analysis dataset.

## Usage

``` r
data(cogstate_cpath)
```

## Format

A data frame with 801134 rows and 12 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- Date_DAYS_CONSENT: Test date (Derived to days since study consent
  date)

- Date_DAYS_T0: Test date (Derived to days since study start date \[A4:
  Ranomization date \| LEARN: Baseline registry exam date\])

- Session_ID: Session Identifier (sequentially grouped by BID)

- Instructions: Instructions presented from the
  questionnaire. {Note: (i) for the Complex Activities of Daily Living
  outcome, “Complex Activities of Daily Living Domain Score (CADL)” is
  presented; (ii) for the Interpersonal Functioning Domain outcome,
  “Interpersonal Functioning Domain Score (IF)” is presented, (iii) for
  the CPATH total score, “Total C-Path Score (total)” is presented.}

- Question Number: Number corresponding to the question presented from
  the questionnaire. (Note: for the Complex Activities of Daily Living
  outcome, Interpersonal Functioning Domain outcome, and the CPATH total
  score, this is blank.)

- Question Text: Question presented from the questionnaire. {Note: (i)
  for the Complex Activities of Daily Living outcome, “Complex
  Activities of Daily Living Domain Score (CADL)” is presented; (ii) for
  the Interpersonal Functioning Domain outcome, “Interpersonal
  Functioning Domain Score (IF)” is presented; (iii) for the CPATH total
  score, “Total C-Path Score (total)” is presented.}

- Answer Text: The actual answer given, in text format. (Note: for the
  Complex Activities of Daily Living outcome, Interpersonal Functioning
  Domain outcome, and the CPATH total score, this is blank.)

- Score: The score corresponding to the answer given for the question
  presented from the questionnaire. {Note: (i) for the Complex
  Activities of Daily Living outcome, this reflects the sum of “Score”
  values for questions 1 through 16; (ii) for the Interpersonal
  Functioning Domain outcome, this reflects the sum of “Score” values
  for questions 17 through 26; (iii) for the CPATH total score, this
  reflects the sum of “Score” values for all individual questions.}

- LMN: Average Log10 reaction time score over all questions
  presented. (Note: for the individual questions, Complex Activities of
  Daily Living outcome and Interpersonal Functioning Domain outcome,
  this is blank.)

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
