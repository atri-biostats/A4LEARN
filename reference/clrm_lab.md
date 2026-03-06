# clrm_lab: Clinical Laboratory Results Modernization (CLRM) - Laboratory Tests

ATRI external analysis dataset.

## Usage

``` r
data(clrm_lab)
```

## Format

A data frame with 607613 rows and 44 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- VISIT: LAB VISIT NAME

- VISITTYP: LAB VISIT TYPE

- VISITMOD: LAB VISIT SUB TYPE

- LBNAM: CENTRAL LABORATORY NAME

- SAMPLE_ID: Sample Identifier

- LBDTM_DAYS_CONSENT: COLLECTION DATE TIME (Derived to days since study
  consent date)

- LBDTM_DAYS_T0: COLLECTION DATE TIME (Derived to days since study start
  date \[A4: Ranomization date \| LEARN: Baseline registry exam date\])

- RCVDTM_DAYS_CONSENT: RECEIVED (at the central laboratory) DATE TIME
  (Derived to days since study consent date)

- RCVDTM_DAYS_T0: RECEIVED (at the central laboratory) DATE TIME
  (Derived to days since study start date \[A4: Ranomization date \|
  LEARN: Baseline registry exam date\])

- SPECMNUM: SPECIMEN MATERIAL ID

- LBSPEC: SPECIMEN MATERIAL DESCRIPTION

- FASTSTAT: FASTING STATUS

- BATTRID: BASE BATTERY ID

- BATTRNAM: BASE BATTERY NAME

- LBTESTCD: LAB TEST CODE

- LBTEST: TEST NAME

- TSTSTAT: TEST STATUS

- TSTDTM_DAYS_CONSENT: TEST DATE TIME (Derived to days since study
  consent date)

- TSTDTM_DAYS_T0: TEST DATE TIME (Derived to days since study start date
  \[A4: Ranomization date \| LEARN: Baseline registry exam date\])

- TSTTYP: TEST TYPE

- RPTRESC: REPORTED TEXT RESULT

- RPTRESN: REPORTED NUMERIC RESULT

- RPTRESNP: REPORTED RESULT NUMERIC PRECISION

- RPTNRLO: REPORTED Lower limit of reference range

- RPTNRHI: REPORTED Upper limit of reference range

- RPTU: REPORTED UNITS OF MEASUREMENT

- CNVRESC: CONVENTIONAL TEXT RESULT

- CNVRESN: CONVENTIONAL NUMERIC RESULT

- CNVRESNP: CONVENTIONAL RESULT NUMERIC PRECISION

- CNVNRLO: CONVENTIONAL REF RANGE LO

- CNVNRHI: CONVENTIONAL REF RANGE HI

- CNVU: CONVENTIONAL UOM

- SIRESC: SI TEXT RESULT

- SIRESN: SI NUMERIC RESULT

- SIRESNP: SI RESULT NUMERIC PRECISION

- SINRLO: SI REF RANGE LO

- SINRHI: SI REF RANGE HI

- SIU: SI UOM

- RPTRTYP: RESULT TYPE

- ALRTFL: ALERT FLAG

- DELTFL: DELTA FLAG

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
