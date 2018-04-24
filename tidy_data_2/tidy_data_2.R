library(tidyverse)

#table2 is an example of when data is scattered across multiple rows
table2

#use spread()
spread(table2, key = type, value = count)

stocks <- tibble(
  year = c(2015, 2015, 2016, 2016),
  half = c(1, 2, 1, 2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>%
  spread(year, return) %>%
  gather("year", "return", '2015':'2016')

table4a %>%
  gather('1999', '2000', key = "year", value = "cases")

preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes", 'NA', 10,
  "no", 20, 12
)

#spread or gather preg?
#gather

preg %>%
  gather('male', 'female', key = "gender", value = "weight")

#missing values
stocks <- tibble(
  year = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr = c(1, 2, 3, 4, 2, 3, 4),
  return = c(1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66)
)

#use spread() to make implicit missing values explicit
stocks %>%
  spread(year, return)

#with gather() you can set na.rm = TRUE to make missing values implicit
stocks %>%
  spread(year, return) %>%
  gather(year, return, '2015':'2016', na.rm = TRUE)

#complete() takes a set of columns, and finds all unique combinations
#then ensures original dataset contains all those values
stocks %>% 
  complete(year, qtr)

treatment <- tribble(
  ~person, ~treatment, ~response,
  "Derrick Whitmore", 1, 7,
  NA, 2, 10,
  NA, 3, 9,
  "Katherine Burke", 1, 4
)

#fill() missing values replaced by most recent non-missing value
treatment %>%
  fill(person)

who

#gather all columns from new_sp_m014 to newrel_f65
who1 <- who %>%
  gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE)
who1

#get hint of structure of values in new key column by using count() on key column
who1 %>%
  count(key)

#use str_replace on newrel => new_rel to make consistent with other variable names
who2 <- who1 %>%
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))
who2

#separate key values on "_"
who3 <- who2 %>%
  separate(key, c("new", "type", "sexage"), sep = "_")
who3

who3 %>%
  count(new)

#drop new, iso2, iso3
who4 <- who3 %>%
  select(-new, -iso2, iso3)
who4

#separate seaxage into sex and age
who5 <- who4 %>%
  separate(sexage, c("sex", "age"), sep = 1)
who5

#for each country, year and sex compute total number of cses of TB
who5 %>%
  count(country, year, sex, wt = cases)
