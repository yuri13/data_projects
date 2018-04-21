library(tidyverse)

ggplot(diamonds, aes(carat)) +
  geom_bar()
ggsave("diamonds.pdf")

write_csv(diamonds, "diamonds.csv")
