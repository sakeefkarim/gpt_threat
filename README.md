# How Legacies of Geopolitical Trauma Shape Popular Nationalism Today

This repository includes the input files and scripts needed to replicate the ***main analyses*** in ["How Legacies of Geopolitical Trauma Shape Popular Nationalism Today", _American Sociological Review_ Vol. 86(3) 406–429](https://journals.sagepub.com/doi/full/10.1177/00031224211011981).

**Note**: More files will be added in the coming months (i.e., by early-2022).

## What you'll need

To replicate our main results, you'll need:

1. Access to three different programs: `Latent GOLD` version 5.1 or 6.0 (to estimate latent class models); `Stata` (to estimate multinomial regressions with clustered standard errors); and `R` (to estimate path models).

2. To modify the "outfile" in your Latent GOLD syntax file: under options, specify your desired file name for an output file containing posterior membership probabilities and modal classes for every respondent (but make sure that this file name ends in either `.csv` or `.sav`).

3. To run `renv::restore()` in R before estimating the different path models. 
