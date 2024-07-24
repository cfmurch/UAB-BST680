########################## JOINING DATA ############################

######## LOAD PACKAGES ########

library(tidyverse)
library(glue)
library(gt)

######## DATA DICTIONARY ########

### The analysis will involve two datasets:
  ## `office_ratings.csv`: the IMDB rating for each episode.
  ## `office_director_and_writers.csv` the writers and director of each episode.

ratings_descr <-
  c("season"      = "Season that the episode aired",
    "episode"     = "Episode number, relative to Season start",
    "title"       = "Title of the episode",
    "imdb_rating" = "Mean IMDB rating",
    "total_votes" = "Total number of IMDB members who rated the episode",
    "air_date"    = "Date that the episode aired")

drctr_wrtr_descr <- 
  c("season"   = "Season that the episode aired", 
    "title"    = "Title of the episode", 
    "director" = "Name of the episode's director", 
    "writer"   = "Name of contributing writer")

data_names <- c("ratings", "director and writers")

tbls <- list(ratings_descr, drctr_wrtr_descr) |> 
  map2(.y = data_names,
       ~ enframe(.x) |>
         gt(rowname_col = "name") |>
         tab_stubhead(label = 'Variable name') |> 
         cols_label(value = 'Variable description') |> 
         cols_align('left') %>% 
         tab_header(title = glue('Description of {.y} data'))
  )

tbls[[1]]
tbls[[2]]

######## LOAD DATA ########

### You can import the two datasets using the `read_csv()` function. 
  ##Note that your project directory is the root of the file path.

# Read in both the 'office_ratings.csv' file and 
# the 'office_director_and_writers.csv' file.

################################################################################
################################################################################
################################################################################

### Exercise 1

# Conduct exploratory data analysis of the `office_ratings` 
  # data and produce the figure '01_solution.rds'.







#################################
### Exercise 2

# Identify the episode names that are present in `office_ratings` but 
  # not in `office_director_and_writers`. 
  # Then, identify the episode names that are present 
  # in `office_director_and_writers` but not in `office_ratings`. 






#################################
### Exercise 3

# Design and implement a strategy to harmonize the episode names between these 
  # two data sets so that they can be joined. When you are 
  # finished, `anti_join()`ing the two data sets should produce an empty data set.
# Once the names are harmonized, left join the `office_director_and_writers` data 
  # with the `office_ratings` data

#Hints: 
# I used the following functions to harmonize episode names: 
  # `tolower()`, `str_remove_all()`, and `str_replace()`.

# Don't worry if it takes more than a few steps to get everything harmonized. 
  # Just take it one step at a time.





#################################
### Exercise 4

#Summarize the merged data by computing 

  # the number of episodes that each writer contributed to.
  # the mean rating of episodes by writer.

# Using the summarized data, create a new column that indicates 
  # who is a `top_writer`. The criteria for being identified as 
  # a `top_writer` are having a mean episode rating > 8.6 or writing > 20 episodes.





#################################
### Exercise 5

#Merge the data you created in problem 4 with the data you previously 
  # merged in problem 3, and then create a dataset that includes the 
  # top 5 episodes for each `top_writer`, arranged by rating. 
  # If the `top_writer` wrote k < 5 episodes, just show the k episodes that 
  # the writer contributed to. 














