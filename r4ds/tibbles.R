library(tidyverse)

#as_tibble() - coerce dataframe to tibble
as_tibble(iris)

tibble(
  x = 1:5,
  y = 1,
  z = x ^ 2 + y
)

#tibble can have non-suntactic column names
tb <- tibble(
  ':)' = "smile",
  ' ' = "space",
  '2000' = "number"
)
tb

#customized for data entry in code
tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)

#tibbles show only first 10 rows
tibble(
  a = lubridate::now() + runif(1e3) * 86400,
  b = lubridate::today() + runif(1e3) * 30,
  c = 1:1e3,
  d = runif(1e3),
  e = sample(letters, 1e3, replace = TRUE)
)

#control width of displayed rows with width and number of rows with n
nycflights13::flights %>%
  print(n = 10, width = Inf)

#rstudios built-in data viewer
nycflights13::flights %>%
  View()

#extract with $ and [[
df <- tibble(
  x = runif(5),
  y = rnorm(5)
)

#extract by name
df$x

df[["x"]]

#extract by position
df[[1]]

#for pipes need special placeholder
df %>% .$x

df %>% .[["x"]]

print(mtcars)

df <- data.frame(abc = 1, xyz = "a")
df$x
df[,"xyz"]
df[, c("abc", "xyz")]
