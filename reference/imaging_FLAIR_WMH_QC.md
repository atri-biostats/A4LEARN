# imaging_FLAIR_WMH_QC: Imaging - FLAIR MRI White Matter Hyperintensities (WMH) QC

ATRI external analysis dataset.

## Usage

``` r
data(imaging_FLAIR_WMH_QC)
```

## Format

A data frame with 6793 rows and 9 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- foldername: Source proc folder name

- QC: Codes whether or not data passed QC

- QCNotes: Codes why QC failed and/or what was done to fix the data

- WMHvol_masked: Volume of White matter hyperintensities in cubic mm
  after masking with regional freesurfer mask

- ICV: Estimate of total intracranial volume in cubic mm

- WMH_corrected: Variable to be used for analysis. Computed as
  (WMHvol_masked/ICV)\*1300

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
