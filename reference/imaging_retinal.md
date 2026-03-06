# imaging_retinal: Imaging - Retinal

ATRI external analysis dataset.

## Usage

``` r
data(imaging_retinal)
```

## Format

A data frame with 498 rows and 10 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- ExamDate_DAYS_CONSENT: Date scan obtained (Derived to days since study
  consent date)

- ExamDate_DAYS_T0: Date scan obtained (Derived to days since study
  start date \[A4: Ranomization date \| LEARN: Baseline registry exam
  date\])

- Eye: Eye that is been imaged

- Field: Exact location

- NumberOfImages: Number of images

- NumberPassingImages: Number of images that pass-through IQ

- Exclude: Indicate if excluded from analysis

- RAIModelScore: Index discriminate score based on PET Amyloid Status

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
