library(tidyverse)
library(forcats)

x1 <- c("Dec", "Apr", "Jan", "Mar")

x2 <- c("Dec", "Apr", "Jam", "Mar")

sort(x1)

month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)

y1 <- factor(x1, levels = month_levels)
y1

sort(y1)

y2 <- factor(x2, levels = month_levels)
y2

y2 <- parse_factor(x2, levels = month_levels)

factor(x1)

#if you want order of levels to match order in dataset, use unique
f1 <- factor(x1, levels = unique(x1))
f1

f2 <- x1 %>% factor() %>% fct_inorder()
f2

#forcats::gss_cat is data from the General Social Survey
gss_cat %>%
  count(race)

ggplot(gss_cat, aes(race)) +
  geom_bar()

#force ggplot to show levels with no value
ggplot(gss_cat, aes(race)) +
  geom_bar() +
  scale_x_discrete(drop = FALSE)

#explore rincome(reported income)
ggplot(gss_cat, aes(rincome)) +
  geom_bar()

#bar chart was cramp, try count
gss_cat %>%
  count(rincome)

#most common relig?
ggplot(gss_cat, aes(relig)) +
  geom_bar()

gss_cat %>%
  count(relig)
#answer protestant

#what is most common partyid?
ggplot(gss_cat, aes(partyid)) +
  geom_bar()

gss_cat %>%
  count(partyid)
