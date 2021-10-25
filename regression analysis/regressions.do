clear

use "PATH TO analytic_df.dta" 


********************************************************************************

*Main Models

********************************************************************************


*Model 1 (Individual-Level)

mlogit schema gpt i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country)


*Model 2 (GDP, Insecurity, Population)

mlogit schema gpt lgdp lpop insecurity i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country)


*Model 3 (Nation-State Formation, Specific Historical Episodes)

mlogit schema gpt since_nsf british_dep axis_power communist i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country)


*Model 4 (Diversity, Exclusion)

mlogit schema gpt ethfrac relfrac avg_excl gini i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country)


*Model 5 (Migration, Globalization)

mlogit schema gpt net_mig mig_share globalization i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country)


*Model 6 (Democracy, Federalism)

mlogit schema gpt stnd_libdem stnd_acclibdem i.fed i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country)



********************************************************************************

*Quantities of Interest

********************************************************************************

*Model 1

mlogit schema gpt i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country)

margins , at(gpt=(1 5)) predict(outcome (1))
margins , at(gpt=(1 5)) predict(outcome (2))
margins , at(gpt=(1 5)) predict(outcome (3))
margins , at(gpt=(1 5)) predict(outcome (4))


*Model 2

mlogit schema gpt lgdp lpop insecurity i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country)

margins , at(gpt=(1 5)) predict(outcome (1))
margins , at(gpt=(1 5)) predict(outcome (2))
margins , at(gpt=(1 5)) predict(outcome (3))
margins , at(gpt=(1 5)) predict(outcome (4))


*Model 3

mlogit schema gpt since_nsf british_dep axis_power communist i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country) 

margins , at(gpt=(1 5)) predict(outcome (1))
margins , at(gpt=(1 5)) predict(outcome (2))
margins , at(gpt=(1 5)) predict(outcome (3))
margins , at(gpt=(1 5)) predict(outcome (4))


*Model 4

mlogit schema gpt ethfrac relfrac avg_excl gini i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country)

margins , at(gpt=(1 5)) predict(outcome (1))
margins , at(gpt=(1 5)) predict(outcome (2))
margins , at(gpt=(1 5)) predict(outcome (3))
margins , at(gpt=(1 5)) predict(outcome (4))

*Model 5

mlogit schema gpt net_mig mig_share globalization i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country) 

margins , at(gpt=(1 5)) predict(outcome (1))
margins , at(gpt=(1 5)) predict(outcome (2))
margins , at(gpt=(1 5)) predict(outcome (3))
margins , at(gpt=(1 5)) predict(outcome (4))


*Model 6 

mlogit schema gpt stnd_libdem stnd_acclibdem i.fed i.wave i.education i.marital age i.religiosity i.inc_5, cluster(country) 

margins , at(gpt=(1 5)) predict(outcome (1))
margins , at(gpt=(1 5)) predict(outcome (2))
margins , at(gpt=(1 5)) predict(outcome (3))
margins , at(gpt=(1 5)) predict(outcome (4))

*25th/75th percentiles of liberal democracy - predicting Liberal/Restrictive share:

margins, at (stnd_libdem =(-0.3917422 0.6696077)) predict(outcome (1))
margins, at (stnd_libdem =(-0.3917422 0.6696077)) predict(outcome (4))

*25th/75th percentiles of cumulative liberal democracy - predicting Liberal/Restrictive share:

margins, at (stnd_acclibdem =(-0.8249460  0.8693204)) predict(outcome (1))
margins, at (stnd_acclibdem =(-0.8249460 0.8693204)) predict(outcome (4))
