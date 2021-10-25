# PREAMBLE ----------------------------------------------------------------

# Load the following datasets!

library(renv)
library(lavaan)
library(broom)
library(lavaanPlot)
library(tidyverse)

# PREPARING THE DATA ------------------------------------------------------

#Note: Running renv::restore() should allow you to work with the packages
#used to generate the path analysis.

#Loading the analytic dataset:

df <- readRDS("./data/analytic_df.rds") 

#Generating pooled means of liberal democracy measures (unstandardized):

democracy <- df %>% select(country, lib_dem, acc_libdem) %>% 
                    with_groups(country, mutate_all, mean) %>% 
                    distinct()

#Generating pooled, country-level distributions of schemas:

schema_distribution <- df %>% group_by(country, schema) %>% 
                              summarise(n = n()) %>% 
                              mutate(share = n/sum(n) * 100) %>% 
                              ungroup() %>% select(-n) %>% 
                              #Zooming in on restrictive/liberal shares:
                              filter(str_detect(schema, "Lib|Rest")) %>% 
                              #Reshaping to ensure that liberal/restrictive shares are their own variables:   
                              pivot_wider(names_from = schema, values_from = share) %>% 
                              rename_at(vars(2:3), list(~ tolower(paste0(., "_share"))))

#Merging with two data frames (from above) with distinct GPT values by country:

path_df <- df %>% with_groups(country, distinct, gpt) %>% 
                  left_join(., democracy) %>% 
                  left_join(., schema_distribution) 


# PATH MODEL — LIBERAL ----------------------------------------------------

#Direct, unmediated effects:

libmodel_direct <- " # exogenous
                       liberal_share ~ gpt
                       "

lib_direct <- sem(libmodel_direct, data = path_df)


#Note: Std.all = standardized estimate (for observed variables)

#See: https://web.archive.org/web/20210203140058/https://lavaan.ugent.be/tutorial/sem.html

summary(lib_direct, fit.measures = TRUE, standardized = TRUE)

lib_direct %>% tidy() %>% slice(1) %>% select(term, std.all, p.value)

#Fully saturated model:

libmodel_full <- "  # direct effect
                      liberal_share ~ direct*gpt
                    # mediation
                      lib_dem ~ m1*gpt
                      acc_libdem ~ m2*gpt
                      lib_dem ~ m3*acc_libdem
                      liberal_share ~ m11*lib_dem
                      liberal_share ~ m22*acc_libdem 
                    # indirect effects
                      path_1 := m1*m11
                      path_2 := m2*m22
                      path_3 := m2*m3*m11
                    # total/indirect effects
                      indirect := (m1*m11) + (m2*m22) + (m2*m3*m11)
                      total := direct + (m1*m11) + (m2*m22) + (m2*m3*m11)
                                  "

lib_full <- sem(libmodel_full, data = path_df)

#This is a lot of information!

lib_full %>% tidy()

#It's easier to quickly generate a path diagram:

lib_labels <- list(liberal_share = "Liberal Popular Nationalism", 
                   gpt = "Geopolitical Threat", 
                   lib_dem = "Liberal Democracy",
                   acc_libdem = "Cumulative Liberal Democracy")

lavaanPlot(model = lib_full, 
           labels = lib_labels, 
           coefs = TRUE, 
           stand = TRUE, 
           stars = c("regress"))


# PATH MODEL — RESTRICTIVE ------------------------------------------------

#Direct, unmediated effects:

restmodel_direct <- " # exogenous
                        restrictive_share ~ gpt
                       "

rest_direct <- sem(restmodel_direct, data = path_df)


summary(rest_direct, fit.measures = TRUE, standardized = TRUE)


rest_direct %>% tidy() %>% slice(1) %>% select(term, std.all, p.value)


#Fully saturated model:

restmodel_full <- "  # direct effect
                       restrictive_share ~ direct*gpt
                    #  mediation
                       lib_dem ~ m1*gpt
                       acc_libdem ~ m2*gpt
                       lib_dem ~ m3*acc_libdem
                       restrictive_share ~ m11*lib_dem
                       restrictive_share ~ m22*acc_libdem 
                    #  indirect effects
                       path_1 := m1*m11
                       path_2 := m2*m22
                       path_3 := m2*m3*m11
                    #  total/indirect effects
                       indirect := (m1*m11) + (m2*m22) + (m2*m3*m11)
                       total := direct + (m1*m11) + (m2*m22) + (m2*m3*m11)
                                  "

rest_full <- sem(restmodel_full, data = path_df)

#Tidy summary:

rest_full %>% tidy()

#Path diagram:

rest_labels <- list(restrictive_share = "Restrictive Popular Nationalism", 
                    gpt = "Geopolitical Threat", 
                    lib_dem = "Liberal Democracy",
                    acc_libdem = "Cumulative Liberal Democracy")


lavaanPlot(model = rest_full, 
           labels = rest_labels, 
           coefs = TRUE, 
           stand = TRUE, 
           stars = c("regress"))