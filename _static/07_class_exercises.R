########################## RESHAPING DATA ############################

######## LOAD PACKAGES ########



################################################################################
################################################################################
################################################################################

### Exercise 1

# Convert the given dataset from wide to long form:
preg <- tibble::tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
  )







#################################
### Exercise 2

#Convert the long dataset you created in exercise 1 into a wide dataset with 
  # `sex` a column indicating male or female sex.
  # `preg_yes` count of pregnancies for the given sex
  # `preg_no` count of non-pregnancies for the given sex.







#################################
### Exercise 3

# Convert the following data into long form, 
  # with one column for `sbp`, `dbp`, and `hr` (heart rate). 

bp <- tibble::tribble(
  ~subjid, ~sbp_1, ~sbp_2, ~dbp_1, ~dbp_2, ~hr_1, ~hr_2,
  'a',      123,    NA,    68,     72,     NA,    70,    
  'b',      140,    139,    NA,     82,     NA,    65
)







#################################
### Exercise 4

# Using the data you created in exercise 3, 
  # add three new columns that measure the number of valid `sbp`, `dbp`, and `hr` 
  # measurements for each `subjid`.







#################################
### Exercise 5

# Read in the `nhanes_long.rds` file, located in the `data` directory.
# Pivot the data into a wider format and create the table shown below.

read_rds('solutions/05_solution.rds') ### This is the table to match NOT the dataset










