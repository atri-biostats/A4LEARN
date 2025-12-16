# cogstate_macq: Cogstate - Memory Complaint Questionnaire

ATRI external analysis dataset.

## Usage

``` r
data(cogstate_macq)
```

## Format

A data frame with 192097 rows and 11 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- Date_DAYS_CONSENT: Test date (Derived to days since study consent
  date)

- Date_DAYS_T0: Test date (Derived to days since study start date \[A4:
  Ranomization date \| LEARN: Baseline registry exam date\])

- Session_ID: Session Identifier (sequentially grouped by BID)

- Question: Question presented from the questionnaire. (Note: for the
  MCQ total score, “MCQT Total” is presented.)

- Answer: Answer given for the presented question. (Note: for the MCQ
  total score, this reflects the sum of “Answer” values for the
  individual questions.)

- Answer Text: The actual answer given, in text format. (Note: for the
  MCQ total score, this is blank.)

- Score: The score corresponding to the answer given for the question
  presented from the questionnaire. (Note: for the MCQ total score, this
  reflects the sum of “Score” values for the individual questions.)

- LMN: Average Log10 reaction time score over all questions
  presented. (Note: for the individual questions, this is blank.)

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
