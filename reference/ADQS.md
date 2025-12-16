# ADQS: \[Derived\] Analysis Data Questionnaire Scores

ATRI derived analysis dataset.

## Usage

``` r
data(ADQS)
```

## Format

A data frame with 247289 rows and 81 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISITCD: Visit Code

- VISIT: Visit

- AVISIT: Analysis Visit

- EPOCH: Epoch

- QSSEQ: Sequence Number given to ensure uniqueness of subject records
  within a domain. May be any valid number.

- QSTESTCD: Topic variable for QS. Short name for the value in QSTEST,
  which can be used as a column name when converting the dataset from a
  vertical format to a horizontal format. The value in QSTESTCD cannot
  be longer than 8 characters, nor can it start with a number
  (e.g.”1TEST”). QSTESTCD cannot contain characters other than letters,
  numbers, or underscores. See QS Terminology Spreadsheet for specific
  text for QSTESTCD. Examples: ADCCMD01, BPR0103

- QSTEST: Verbatim name of the question or group of questions used to
  obtain the measurement or finding. The value in QSTEST cannot be
  longer than 40 characters. See QS Terminology Spreadsheet for specific
  text for QSTEST. Example: Fist, BPR01 - Emotional Withdrawal

- QSCAT: Used to define a category of related records that will be
  meaningful to the Reviewer. See QS Terminology Spreadsheet for
  specific text for QSCAT. Examples: ADAS-COG, MDS-UPDRS.

- QSVERSION: Test version administered.

- QSLANG: Questionnaire language.

- QSSTRESN: Used for continuous or numeric findings in standard format;
  copied in numeric format from QSSTRESC. QSSTRESN should store all
  numeric results or findings.

- QSBLRES: QS Baseline Score

- QSCHANGE: QS Change from Baseline

- QSBLSD: QS Baseline Standard Deviation

- QSBLFL: Indicator used to identify a baseline value. The value should
  be “Y” or null.

- QSDTC_DAYS_CONSENT: Date of questionnaire. registry.EXAMDATE (Derived
  to days since study consent date)

- QSDTC_DAYS_T0: Date of questionnaire. registry.EXAMDATE (Derived to
  days since study start date \[A4: Ranomization date \| LEARN: Baseline
  registry exam date\])

- QSADTC_DAYS_CONSENT: Analysis date of questionnaire.
  registry.EXAMDATE, if it exists, otherwise manually reviewed
  missing_pacc_dates_verify.EXAMDATE.verify (Derived to days since study
  consent date)

- QSADTC_DAYS_T0: Analysis date of questionnaire. registry.EXAMDATE, if
  it exists, otherwise manually reviewed
  missing_pacc_dates_verify.EXAMDATE.verify (Derived to days since study
  start date \[A4: Ranomization date \| LEARN: Baseline registry exam
  date\])

- QSDY: Study Day of Finding

- ADURW: Study Week of Finding

- ASEQMMRM: Sequence for MMRM, mapped using AVISIT (012-\>1...066-\>10)

- ASEQNCS: Sequence for NCS, mapped using AVISIT (006-\>1...066-\>11)
  for participant without missing AVISIT, and use Visit Number for those
  with missing AVISIT (max 11 visits, and visit code 066 is always visit
  11)

- ANL01FL: Y if data should be included in NCS.

- ANL02FL: Y if data should be included in MMRM.

- TX: Random treatment assigment.

- AGEYR: Age in years at Consent

- MARITAL: Marital Status

- SEX: Sex

- RACE: Race

- EDCCNTU: Years of education

- ETHNIC: Ethnicity

- WRKRET: Participant Retirement Status

- TESTLNG: Language to be used for testing

- SAMELNG: Testing and Primary Lang are the same

- RESIDENCE: Type of Residence

- DISCDTC_DAYS_CONSENT: Subject Discontinuation Date Character (Derived
  to days since study consent date)

- DISCDTC_DAYS_T0: Subject Discontinuation Date Character (Derived to
  days since study start date \[A4: Ranomization date \| LEARN: Baseline
  registry exam date\])

- ENRLDT_DAYS_CONSENT: Enrollment Date (Derived to days since study
  consent date)

- ENRLDT_DAYS_T0: Enrollment Date (Derived to days since study start
  date \[A4: Ranomization date \| LEARN: Baseline registry exam date\])

- RNDMDT_DAYS_CONSENT: Randomization Date (Derived to days since study
  consent date)

- RNDMDT_DAYS_T0: Randomization Date (Derived to days since study start
  date \[A4: Ranomization date \| LEARN: Baseline registry exam date\])

- GDSSEVBL: Geriatric Depression Scale Score \> 5

- SUBJCOMPTR: Subj Completer Set - TR Phase

- TRTENDT_DAYS_CONSENT: Treatment End Date (Derived to days since study
  consent date)

- TRTENDT_DAYS_T0: Treatment End Date (Derived to days since study start
  date \[A4: Ranomization date \| LEARN: Baseline registry exam date\])

- TRTSTDT_DAYS_CONSENT: Treatment Start Date (Derived to days since
  study consent date)

- TRTSTDT_DAYS_T0: Treatment Start Date (Derived to days since study
  start date \[A4: Ranomization date \| LEARN: Baseline registry exam
  date\])

- HGTCMBL: Height in Cm at Baseline

- WGTKGBL: Weight in Kg at Baseline

- BMIBL: body mass index (weight (kg) / \[height (m)\]^2)

- ALCHLBL: Current Alcohol Consumer at Baseline

- CFBL: Current Caffeine User at Baseline

- TBBL: Current Tobacco User at Baseline

- COGDSSTTSV1: DSST Total Score at Visit 1

- COGDSSTTSV6: DSST Total Score at Visit 6

- COGLMDRTSV1: LM Delayed Recall Total Score at Visit 1

- COGLMDRTSV6: LM Delayed Recall Total Score at Visit 6

- COGTOTRECSV1: Total Recall Score at Visit 1

- COGTOTRECSV6: Total Recall Score at Visit 6

- MMSETSV1: MMSE Total Score at Visit 1

- MMSETSV6: MMSE Total Score at Visit 6

- PACCV6: PACC Total Score at Visit 6

- APOEGN: APOE4 genotype (ε2/ε4, ε3/ε4, ε4/ε4, no ε4)

- APOEGNPRSNFLG: APOE4 carrier status (carrier \[ε2/ε4, ε3/ε4, ε4/ε4\],
  noncarrier \[ε3/ε3, ε2/ε2,ε3/ε2\])

- AAPOEGNPRSNFLG: APOE4 carrier status used for analysis. If
  APOEGNPRSNFLG is missing, carrier status is assumed to be noncarrier
  as in the randomization plan.

- SUVRCER: Amyloid PET composite SUVR

- AMYLCENT: Amyloid PET centiloids. AMYLCENT = 183.07 x SUVRCER –
  177.26.

- SUBJITTTR: Subj Intent to Treat Set - TR Phase

- MITTFL: Modified Intent-to-Treat Flag

- SUBJSAFTR: Safety Population Flag

- PCCPFL: Placebo-Controlled Completers Population Flag

- PRTVIIE: Protocol Violation - Eligibility Criteria Flag

- PRTVIMAS: Protocol Violation - Missed ADCS-PACC Flag

- CON3FL: Protocol Violation - Missed Consecutive Infusions

- PRTVITMS: Protocol Violation - Missed Infusions

- PPTRTDUR: Treatment Duration \>240wk for Completers Flag

- SUBJPPSTR: Subj Per Protocol Set - TR Phase

- TAUPETFL: Tau PET (Flortaucipir) and mITT Participant Flag

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
