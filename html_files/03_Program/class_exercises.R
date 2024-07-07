############################## PROGRAMMING BASICS ##############################

######## OVERVIEW ########

# These exercises will help you practice what you have 
   # learned about functions and vectors.


######## PACKAGES ########

library(gt)
library(tidyverse)


######## VECTORS ########

# The two vectors needed to complete the exercises are created below.
cases <- read_rds('solutions/cases_byday.rds')

days <- read_rds('solutions/days_since_2020-01-22.rds')


######## EXERCISES ########

#### Exercise 1

# How many cases were diagnosed on the 10th, 25th, and 50th day?





#### Exercise 2

# How many total cases were diagnosed on or before day 50?





#### Exercise 3

# Find the first day when the number of new cases exceeded 50.





#### Exercise 4

# How many days have had 1000 or more new cases identified?





#### Exercise 5

# Create a vector containing the mean, median, minimum, and maximum values of `cases`. 
  # Give the vector names that correspond with these terms, i.e., 
  # `c("Mean", "Median", "Min", "Max")`.





#### Exercise 6

# Learn something new! 
  # There is a function in the `tibble` package called `enframe()`. 
  # This function transforms a named vector into a `tibble`, i.e. a dataframe, 
    # with columns `name` and `value`. The `name` column holds the vector's names 
    # and the `value` column holds the vector's values. 

  # Use the `enframe()` function on the named vector from the previous exercise. 
  # Then, use what you learned last week about the `gt` package to create the table below:





