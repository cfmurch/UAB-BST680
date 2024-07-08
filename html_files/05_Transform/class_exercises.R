######################## DERIVE INFORMATION WITH DPLYR #########################

######## LOAD PACKAGES ########

library(tidyverse)  # includes dplyr - filter / select
library(gt)         # for tables

######## LOAD DATA ########

nhanes <- read_rds('data/NHANES_analysis_post_exclusions.rds')

# trying to print all rows will make df_print: paged cause a pandoc error.
# don't modify the line below! It may break knitr.
nhanes[1:10, ]

######## DATA DICTIONARY ########

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
  "age"               = "SP age, years",
  "age_group"         = "SP age group, years",
  "sex"               = "SP sex",
  "race_ethnicity"    = "SP race and/or ethnicity",
  "education"         = "SP education",
  "income_hh"         = "SP household income",
  "bp_sys_mmhg"       = "SP systolic blood pressure, mm Hg",
  "bp_dia_mmhg"       = "SP diastolic blood pressure, mm Hg",
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

################################################################################
################################################################################
################################################################################

### Exercise 1

# Group the `nhanes` data by exam and sex, then apply the `summarize()` function 
  # to compute the mean systolic blood pressure and standard error for 
  # the mean systolic blood pressure at each exam year, for men and women, separately. 

# Notes: 
  # The standard error of a vector 'x' with 'n' observations is 
        ## {standard deviation of x} / sqrt{n} ##
  # The mean systolic blood pressure should be named `sbp_mn`
  # The standard error of systolic blood pressure should be named `sbp_se`







#################################
### Exercise 2

# Using the summary data you created in problem 1, create a figure to 
  # explore trends in mean systolic blood pressure. 

# What do you think drove the trends you see?
  
# Be careful! The results we are looking at are not adjusted using the NHANES weights. 
  #Therefore, results are not nationally representative.

# Notes: 
  #`geom_line` expects a grouping aeshetic, specified 
  # with `aes(group = <grouping variable>)`.

# If you'd like a challenge, add standard error bars. (optional)







#################################
### Exercise 3

# Using the `nhanes` data, compute race-by-sex specific estimates of the 
  # prevalence of hypertension in each exam year.

# Note: 
  # hypertension is defined as having systolic blood pressure > 140 mm Hg, diastolic blood pressure > 90 mm Hg, or currently using antihypertensive medications.

# You will want to group by three variables.







#################################
### Exercise 4

# Learn something new: Later on in the course, we will learn about reshaping data. 
  # One of the most useful functions for reshaping is called `pivot_wider`. 
  # Here is how it transforms the long data we created in exercise 3:


# create one column for each exam year
# values in each column are the percent with hypertension
read_rds('solutions/03_solution.rds') |> 
  pivot_wider(names_from = exam, values_from = htn)

# Use these wider data in combination with the `gt` package to reproduce the table below.

# Notes: 
  # `gt` handles grouped datasets by creating a table subsection for each group (i.e., same as setting `groupname_col`).
  # `fmt_percent` and `sub_missing` are used to control formatting.
  # `tab_spanner()` creates table headers spanning columns. 
  # `summary_rows` is used to create the Overall summary for each sex group.









#################################
### Exercise 5

# Using the dataset you created in exercise 3, compare the prevalence of 
  # hypertension between 2013 and 2017 for race-sex groups. 
  # Compute the increase (relative and absolute) in prevalence for each group.

# Notes:
  # Absolute difference: {prevalence from 2017} - {prevalence from 2013}
  # Relative difference: ({prevalence from 2017} / {prevalence from 2013}) - 1









#################################
### Exercise 6

# Tabulate the data you created in exercise 5, using some of the stylistic 
  # features that `gt` offers. 

# Notes: 
  # the function used to color cells is `data_color()`. 
  # Learn more about it (https://gt.rstudio.com/reference/data_color.html) 
  # Usually there are examples at the bottom of function help pages








