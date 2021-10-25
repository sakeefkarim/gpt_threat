# How Legacies of Geopolitical Trauma Shape Popular Nationalism Today

This repository includes the input files and scripts needed to replicate the ***main analyses*** in ["How Legacies of Geopolitical Trauma Shape Popular Nationalism Today", _American Sociological Review_ Vol. 86(3) 406–429](https://journals.sagepub.com/doi/full/10.1177/00031224211011981).

**Note**: More files will be added in the coming months (i.e., by early-2022).

## What you'll need

To replicate our main results, you'll need to:

1. Use three different programs: `Latent GOLD 5.1` or `6.0` (to estimate latent class models); `Stata` (to estimate multinomial regressions with clustered standard errors); and `R` (to estimate path models).

2. Retrieve files from the three (*non-renv*) subfolders included in this repository.[^1]

3. Modify the "outfile" in your Latent GOLD syntax by specifying your desired file name (e.g., `classifications.sav`).[^2]

4. To run `renv::restore()` in R before estimating the different path models. 


[^1]: To view all the scripts (inclusive of the `.do` and `.lgs` files), open `gpt_threat.Rproj` in R Studio and then explore the contents of the subfolders.

[^2]: Make sure that this file name ends in either `.csv` or `.sav`.
