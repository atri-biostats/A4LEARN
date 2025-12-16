# cogstate_battery: Cogstate - Computerized Battery

ATRI external analysis dataset.

## Usage

``` r
data(cogstate_battery)
```

## Format

A data frame with 278212 rows and 40 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- Hand: Dominant hand

- Sex: Sex

- TDate_DAYS_CONSENT: Test date (Derived to days since study consent
  date)

- TDate_DAYS_T0: Test date (Derived to days since study start date \[A4:
  Ranomization date \| LEARN: Baseline registry exam date\])

- Session_ID: Session Identifier (sequentially grouped by BID)

- VISCODE: NA

- TCode: Test code

- GMLidx: GML test index

- mps: Moves per second

- dur: Duration of test (ms)

- ter: Total errors (count)

- ler: Legal errors (count)

- rer: Rule break errors (count)

- per: Perseverative errors (count)

- lmn: Speed of performance (log10 msec)

- lsd: Standard deviation of speed of performance

- acc: Accuracy (arcsin sqrt proportion)

- cor: Correct responses (count)

- err: Errors (count)

- presnt: Presentation count (Correct + Errors)

- metric: BPSO metric; ability to discriminate ‘lures’ from ‘similar’
  objects (proportion)

- percor: Percent correct (proportion)

- cmv: Correct moves

- rth: Return to head moves

- sti: Stimuli (count)

- cfo: Correct foils recalled

- res: Responses (count)

- Completion: Test completion flag (0 = pass; 1 = fail)

- Integrity: Test integrity flag (0 = pass; 1 = fail)

- SessionNumber: Count of the attempts on a single visit

- SessionCompletion: Session completion criteria

- ExcludeData: Indicator for which test to use

- C3Comp: The score on the Cogstate C3 composite, incorporating the
  BPSO, Face Name, Detection, Identification One Card Learning and One
  Back tests, relative to age-matched normative data

- LearnWMComp: The score on the Learning/Working Memory composite,
  incorporating the primary outcome measures for the One Card Learning
  and One Back tests (Accuracy), relative to age-matched normative data

- OCLONBComp: The score on the Learning/Working Memory composite,
  incorporating the primary outcome measures for the One Card Learning
  and One Back tests (Accuracy), relative to age-matched normative data

- PsychAttnComp: The score on the Psychomotor Function/Attention
  composite, incorporating the Detection and Identification tests,
  relative to age-matched normative data

- AttnComp: The score on the Attention composite, incorporating the
  Detection, Identification and One Back tests, relative to age-matched
  normative data

- C3AbrComp: The score on the Papp 2019, C3 composite, incorporating the
  BPSO, Face Name (matching) and One Card Learning tests, relative to
  age-matched normative data

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
