library(tidyverse)

diamonds2 <- diamonds %>%
  mutate(y = ifelse(y < 3 | y > 20, NA, y))

ggplot(data = diamonds2, mapping = aes(x = x, y = y)) +
  geom_point(na.rm = TRUE)

nycflights13::flights %>%
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60
  ) %>%
  
ggplot(mapping = aes(sched_dep_time)) +
  geom_freqpoly(mapping = aes(colour = cancelled), binwidth = 1/4)

ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_freqpoly(mapping = aes(colour = cut), binwidth = 500)

ggplot(diamonds) +
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) +
  geom_freqpoly(mapping = aes(colour = cut), binwidth = 500)

#shows that better quality diamonds are cheaper on average
ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()

ggplot(data = mpg, mapping)

#show highway mileage across classes
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

#reorder class based on median value of hwy
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy))

?reorder

#flip 90 degrees
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) +
  coord_flip()

?diamonds
#determine which variable is diamond dataset is most important for prediting the price of a diamond
ggplot(data = diamonds, mapping = aes(x = clarity, y = price)) +
  geom_boxplot()

#not a good boxplot
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_boxplot()

ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(x = reorder(carat, price, FUN = median), y = price))

ggplot(data = diamonds) +
  geom_jitter(mapping = aes(x = carat, y = price))

ggplot(data = diamonds) +
  geom_violin(mapping = aes(x = carat, y = price))

ggplot(data = diamonds, mapping = aes(x = carat)) +
  geom_freqpoly(mapping = aes(colour = cut))

#diff between geom_jitter() && ggbeeswarm
set.seed(12345)

ggplot(iris, aes(Species, Sepal.Length)) +
  geom_jitter()

library(ggbeeswarm)
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_quasirandom()

sub_mpg <- mpg[mpg$class %in% c("midsize", "pickup", "suv"),] 
ggplot(sub_mpg, aes(class, displ, color = factor(cyl))) + geom_quasirandom(dodge.width = 1)

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_jitter()

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_quasirandom()

#use geom_count() to visualize the covariation between categorical variables
ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))

#can also compute count with dpylr
diamonds %>%
  count(color, cut)

#visualise with geom_tile()
diamonds %>%
  count(color, cut) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
    geom_tile(mapping = aes(fill = n))


