
library(readxl)
library(tidyverse)
library(meta)
library(metafor)

# Figure 1: High dose fluvoxamine (200mg/day+)
# A: ITT in RCTs
# B: PP in RCTs
# C: ITT for all studies
# D: PP for all studies

# Panel A ----
da <- read_xlsx("data/mortality/01_mortality_rct_itt_high.xlsx")

meta_a <- metabin(event.e = e_fluv, 
                  n.e = n_fluv, 
                  event.c = e_ctrl, 
                  n.c = n_ctrl, 
                  data=da, 
                  sm="or", 
                  method ="MH", 
                  #method.incr = "only0",
                  #RR.Cochrane = TRUE, 
                  #incr = "TACC",
                  overall = TRUE, 
                  MH.exact = FALSE, 
                  allstudies = TRUE,
                  level.ma = 0.5, # The level used to calculate confidence intervals for meta-analysis estimates.
                  studlab = study_id); meta_a
forest(meta_a)


# Panel B ----
db <- read_xlsx("data/mortality/02_mortality_rct_pp_high.xlsx")

meta_b <- metabin(event.e = e_fluv, 
                  n.e = n_fluv, 
                  event.c = e_ctrl, 
                  n.c = n_ctrl, 
                  data=db, 
                  sm="OR", 
                  method.tau ="PM", 
                  studlab = study_id); meta_b
forest(meta_b, prediction = T)


# Panel C ----
dc <- read_xlsx("data/mortality/03_mortality_all_itt_high.xlsx")

meta_c <- metabin(event.e = e_fluv, 
                  n.e = n_fluv, 
                  event.c = e_ctrl, 
                  n.c = n_ctrl, 
                  data=dc, 
                  sm="OR", 
                  method.tau ="PM", 
                  studlab = study_id); meta_b
forest(meta_c, prediction = T)


