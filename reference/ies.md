# ies: Impact of Events Scale

ATRI clinical analysis dataset.

## Usage

``` r
data(ies)
```

## Format

A data frame with 4391 rows and 23 variables.

## Details

- SUBSTUDY: NA

- BID: NA

- VISCODE: NA

- DONE: Was assessment/procedure done?

- NDREASON: If No, reason not done:

- IEDATE_DAYS_CONSENT: Date Collected: (Derived to days since study
  consent date)

- IEDATE_DAYS_T0: Date Collected: (Derived to days since study start
  date \[A4: Ranomization date \| LEARN: Baseline registry exam date\])

- IETHINK: 1. I thought about it when I didn't mean to.

- IEAVOID: 2. I avoided letting myself get upset when I thought about it
  or was reminded of it.

- IEREMOVE: 3. I tried to remove it from my memory.

- IESLEEP: 4. I had trouble falling asleep, because pictures or thoughts
  about it that came into my mind.

- IEWAVES: 5. I had waves of strong feelings about it.

- IEDREAMS: 6. I had dreams about it.

- IEAWAY: 7. I stayed away from reminders of it.

- IEREAL: 8. I felt as if it hadn't happened or it wasn't real.

- IETALK: 9. I tried not to talk about it.

- IEMIND: 10. Pictures about it popped into my mind.

- IETHINGS: 11. Other things kept making me think about it.

- IEDEAL: 12. I was aware that I still had a lot of feelings about it,
  but I didn't deal with them.

- IENOTTHNK: 13. I tried not to think about it.

- IEREMIND: 14. Any reminder brought back feelings about it.

- IENUMB: 15. My feelings about it were kind of numb.

- IESCORE: Total Score

## Examples

``` r
if (FALSE) { # \dontrun{
browseVignettes('A4LEARN')
} # }
```
