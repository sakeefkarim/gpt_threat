# How Legacies of Geopolitical Trauma Shape Popular Nationalism Today

This repository includes the input files and scripts needed to replicate the ***main analyses*** in ["How Legacies of Geopolitical Trauma Shape Popular Nationalism Today", _American Sociological Review_ Vol. 86(3) 406–429](https://journals.sagepub.com/doi/full/10.1177/00031224211011981).

**Note**: More files will be added in the coming months (i.e., by early-2022).

### What you'll need

To replicate our main results, you'll need to:

1. Access to three different programs: `Latent GOLD 5.1` (to estimate our latent class models); `Stata` (to estimate our multinomial regressions); and `R` (to estimate our path models).

2. Modify the "outfile" in Latent GOLD (under options) by specifying your desired file name/path for an output file featuring posterior membership probabilities and modal classes for every respondent (make sure this file name ends in either `.csv` or `.sav`).

3. Run `renv::restore()` in R before estimating the different path models. 
