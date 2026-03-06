# SUBJINFO: \[Derived\] Subject Information

ATRI derived analysis dataset.

## Usage

``` r
data(SUBJINFO)
```

## Format

A data frame with 6945 rows and 64 variables.

## Details

- SUBSTUDY: NA

- BID: NA

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

- TRTESDT_DAYS_CONSENT: Treatment Escalation Date: Date of the first
  visit participant started high dose (800 mg or 1600 mg) (Derived to
  days since study consent date)

- TRTESDT_DAYS_T0: Treatment Escalation Date: Date of the first visit
  participant started high dose (800 mg or 1600 mg) (Derived to days
  since study start date \[A4: Ranomization date \| LEARN: Baseline
  registry exam date\])

- TRTESVIS: Treatment Escalation Visit: First visit participant started
  high dose (800 mg or 1600 mg)

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

- LEARNFL: LEARN Participant Flag

- TAUPETFL: Tau PET (Flortaucipir) Participant Flag

- FRAMINGHAM: Framingham Risk Score

- RESCREENFL: Rescreened Participant Flag

- PREVBID: Previous BID if previously screened

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
