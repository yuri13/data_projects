ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5)

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0, 50))

unusual <- diamonds %>%
  filter(y < 3 | y > 20) %>%
  select(price, x, y, z) %>%
  arrange(y)
unusual

ggplot(unusual) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.25)

ggplot(diamonds) +
  geom_histogram(mapping = aes(x = price), binwidth = 0.25)
