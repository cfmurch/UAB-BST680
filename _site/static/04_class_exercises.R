########################## ISOLATING DATA WITH DPLYR ###########################

######## PACKAGES ########

# Load packages 
library(tidyverse)  # includes dplyr - filter / select
library(gt)


######## LOAD DATA ########

nhanes <- read_rds('data/NHANES_analysis_pre_exclusions.rds')

# trying to print all rows will make df_print: paged cause a pandoc error.
# don't modify the line below!
nhanes[1:10, ]


######## DATA DICTIONARY ########

#Review this briefly and use it as a reference to engage with the exercises below.

# A data dictionary is more comprehensive than these two columns,
  # but these two columns are the core components of a data dictionary.
  # I highly recommend you only engage with data when there is a 
  # data dictionary available. If a collaborator cannot share one of
  # these with you when they ask you to analyze your data, then they 
  # should not be your collaborator.

nhanes_descr <- c(
  "seqn"              = "SP identifier",
  "exam"              = "NHANES exam year",
  "psu"               = "primary sampling unit",
  "strata"            = "survey strata",
  "wts_mec_2yr"       = "survey weights",
  "exam_status"       = "How did SP engage with exam?",
  "age"               = "SP age, years",
  "age_group"         = "SP age group, years",
  "sex"               = "SP sex",
  "race_ethnicity"    = "SP race and/or ethnicity",
  "education"         = "SP education",
  "income_hh"         = "SP household income",
  "pregnant"          = "was SP pregnant at time of exam?",
  "bp_sys_mmhg"       = "SP systolic blood pressure, mm Hg",
  "bp_dia_mmhg"       = "SP diastolic blood pressure, mm Hg",
  "n_msr_sbp"         = "Number of valid systolic BP readings",
  "n_msr_dbp"         = "Number of valid diastolic BP readings",
  "bp_controlled"     = "Did SP have controlled BP? (<140/90 mm Hg)",
  "acr_mgg"           = "SP albumin-to-creatinine ratio, mg/g",
  "albuminuria"       = "Did SP have albuminuria? (ACR > 30 mg/g)",
  "chol_hdl_mgdl"     = "SP HDL-cholesterol, mg/dl",
  "chol_total_mgdl"   = "SP total cholesterol, mg/dl",
  "health_insurance"  = "SP health insurance status",
  "bp_high_aware"     = "SP ever told by Dr: 'you have high blood pressure'?",
  "bp_meds"           = "SP currently using antihypertensive medication?",
  "hc_usual_facility" = "SP has a usual healthcare facility?",
  "hc_visit_1yr"      = "SP visited their healthcare facility last year?"
)


# abbreviations need to be placed in the footnote of the table
abbrevs <- c("SP = survey participant", 
             "BP = blood pressure", 
             "HDL = high density lipoprotein") |> 
  paste(collapse = '; ')

# the enframe function transforms a vector into a tibble,
enframe(nhanes_descr) |> 
  gt(rowname_col = "name") |>
  tab_stubhead(label = 'Variable name') |> 
  cols_label(value = 'Variable description') |> 
  cols_align('right') |> 
  tab_source_note(source_note = abbrevs) |> 
  tab_header(title = 'Description of NHANES data')

# the paste() function is used here. To give a brief summary,
  # paste() combines string vectors. In this case, we are using 
  # paste to collapse a vector and separate each component by '; '


################################################################################

### Exercise 1

# Suppose we are conducting a study and aim to include NHANES participants 
  # meeting the following conditions: 
  
  # Age 18+
  # Completed the NHANES interview and examination
  # Not pregnant at time of exam
  # 1+ systolic and diastolic BP measurement
  # Complete information on BP medication use.

# Create a `tibble` with two columns: 
  
  # `inclusion`: a numeric vector taking values 1, 2, 3, 4, and 5
  # `description`: a character vector comprising the inclusion criteria above.







#################################
### Exercise 2

# Apply the `filter` function to apply each inclusion criteria, 
  # in the same sequence as I listed earlier, to the NHANES data. 
  # Because we need to track how many participants were included 
  # after each step, I would recommend creating five separate datasets, like so: 
  
# your code will fill in the ... with conditions that 
# align with the inclusion criteria given above.
e1 <- filter(nhanes, ...)
e2 <- filter(e1, ...)
e3 <- filter(e2, ...)
e4 <- filter(e3, ...)
e5 <- filter(e4, ...)
  
# hints: 
# 
# use the data dictionary to identify relevant variables.
#
# is.na() returns TRUE when a value is missing. Run this example to verify
# x <- c(1, NA, 3)
# is.na(x)
#
# for e3, be careful. Pregnant is NA for some female participants.
# In this case, we only want to apply the exclusion if we are certain
# that a person was pregnant, so what we really need is to include 
# participants who have pregnant == 'No' OR pregnant is missing.
# think about how you could use the is.na() function.
# 
# for e4 and e5, think about how you could use the is.na() function
# in combination with the NOT (!) operator. For example, !condition
# returns TRUE is the condition is NOT TRUE.

#################################
### Exercise 3
  
# Apply `gt()` to form a publication-ready table describing your inclusions.






#################################
### Exercise 4

# Using your final sample of 51,761 NHANES participants, identify whether 
  # the highest value of systolic BP was provided by a male or female in 
  # each exam year. To do this, you should apply a grouped filter 
  # (i.e., use `group_by()` and then `filter()`).

# The groups should be defined by `exam`.

# The filter step should keep rows that are equal to the maximum 
  # systolic BP value.

# A final step should apply the select function to keep only the `exam`, 
  # `bp_sys_mmhg`, and `sex` columns. 






# Do you notice anything peculiar? Try looking at the minimum 
  # systolic BP values instead. Do you notice any peculiar patterns here?







