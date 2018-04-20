library(tidyverse)

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))

#scatterplots less useful with bigger datasets, alpha aesthetic can help
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price), alpha = 1 / 100)

#geom_bin2d() && geom_hex() also useful for this
ggplot(data = smaller) +
  geom_bin2d(mapping = aes(x = carat, y = price))

install.packages("hexabin")
# hexabin not available for R version 3.4.4

#another option is to bin one continuous variable so it acts like a categorical variable
ggplot(data = smaller, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)))

ggplot(data = smaller, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_number(carat, 20)))

ggplot(data = smaller, mapping = aes(x = price, y = carat)) +
  geom_boxplot(mapping = aes(group = cut_width(price, 20)))

#scatterplot of Old Faithful eruptions length versus wait time between eruptions
ggplot(data = faithful) +
  geom_point(mapping = aes(x = eruptions, y = waiting))
  
library(modelr)

mod <- lm(log(price) ~ log(carat), data = diamonds)

diamonds2 <- diamonds %>%
  add_residuals(mod) %>%
  mutate(resid = exp(resid))

ggplot(data = diamonds2) +
  geom_point(mapping = aes(x = carat, y = resid))

ggplot(data = diamonds2) +
  geom_boxplot(mapping = aes(x = cut, y = resid))


