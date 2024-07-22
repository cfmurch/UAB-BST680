########################## SEPARATE UNITE AND STRINGS ##########################

######## LOAD PACKAGES ########



################################################################################
################################################################################
################################################################################

# Import

cvd_messy <- readr::read_rds('data/cvd_messy.rds')

###############################################################################

### Exercise 1

# Tidy the data up to create the following columns: 
# 
# - `ID`: (numeric) participant identification
# - `cvd_status`: (numeric) 0 if no CVD, 1 if CVD 
# - `cvd_time`: (numeric) years from interview to CVD or loss to follow-up
# - `sbp`: (numeric) systolic blood pressure, mm Hg
# - `dbp`: (numeric) diastolic blood pressure, mm Hg
# - `bp_meds`: (factor) Yes/No for use of blood pressure lowering medication
# - `age_number`: (numeric) age in years
# - `drink`: (factor) Yes/No for drinking  
# - `smoke`: (factor) Yes/No for smoking
# - `albumin`: (numeric) albumin levels
# - `hba1c`: (numeric) HbA1C levels
# - `creatinine`: (numeric) creatinine levels
# 
# Each column can be cleaned in a number of different ways. 
# 
# - You can try to do this in one step although you'll need to use regex look arounds. 
# - Nearly all variables can be managed with `str_detect`, `str_extract`, and `str_remove`. 
# - You could also consider converting some variables into factors with new labels and then using separate. 
# - For the lab values, it will be simplest to start with `separate_longer_delim()`.  
#   The alternative is advanced regex work using look arounds and knowing how lazy/greedy evaluation works.
# 
# Once you are finished, remove the original messy columns










###############################################################################

### Exercise 2


# Create new columns:
# 
# - `diabetes` (factor) Yes if HbA1C is greater than 6.5, No if less than or equal to 6.5
# 
# - `albuminuria` (factor) 'Yes' if albumin / creatinine (i.e. the ratio) is greater than or equal to 30 and 'No' if albumin / creatinine is less than 30
# 
# - `bp_midrange` (factor) Yes if at least one of the two conditions below are true: 
# 
#     + SBP is greater than or equal to 130 and less than 140 
#     + DBP is greater than or equal to 80 and less than 90 
# 
# - `rec_bpmeds_acc_aha` (factor) 'Yes' if any of the conditions below are `TRUE`, and 'No' if all of them are `FALSE`.
# 
#     + SBP is greater than or equal to 140 OR DBP is greater than or equal to 90
#     + `bp_midrange` == 'Yes' and `albuminuria` == 'Yes'
#     + `bp_midrange` == 'Yes' and `diabetes` == 'Yes'
#     + `bp_midrange` == 'Yes' and `age_number` > 65
# 
# 
# - `rec_bpmeds_jnc7` (factor) Yes if SBP > 140 OR DBP > 90, 'No' if SBP is less than or equal to 140 and DBP is less than or equal to 90.
# 
# - Replace any missing values with "Unknown" in the new columns 
#   (hint: you may have more success doing this before factor conversion when using `replace_na()`)










###############################################################################

### Exercise 3

# Use `count` and `mutate`, `str_glue`, and `pivot_wider` to make the following table summarizing counts and percent of diabetes, 
# stratified by recommendations to initiate or intensify BP lowering based on the AHA criteria. Remember to `group` and `ungroup` the data appropriately. 










###############################################################################

### Exercise 4

# You might imagine doing Problem 3 for all variables and then dealing with combining results into a participant characteristics table. 
# Sounds pretty tedious, right? The `gtsummary` package is here for you. 
# Explore the package website and focus on the `tbl_summary()` vignette (http://www.danieldsjoberg.com/gtsummary/articles/tbl_summary.html). 
# When you are ready, try using `tbl_summary()` on the data you created. 

# Before creating your table, make sure that all of the character variables in your data are converted to factor variables, 
# and that all of your factor variables are given an explicit `NA` coding such that missing values are given a value of 'Unknown'. 
# If you've done everything right, this should have been handled in steps 1 and 2.


















 
