
library(readxl)
library(tidyverse)
library(meta)
library(metafor)

# Figure 2: High dose fluvoxamine (200mg/day+)
# A: ITT in RCTs
# B: ITT for all studies

# Panel A ----
da <- read_xlsx("data/hospitalization/01_hosp_rct_itt_high.xlsx") #%>% filter(!(study_id %in% c("Lenze et al., 2020")))

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
                  level.ma = 0.95, # The level used to calculate confidence intervals for meta-analysis estimates.
                  studlab = study_id); meta_a
forest(meta_a)
