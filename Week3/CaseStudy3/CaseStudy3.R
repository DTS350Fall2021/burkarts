#Install and load packages
library(tidyverse)
install.packages("gapminder")
library(gapminder)

#Remove gapminder
view(gapminder)
life_data <- gapminder %>%
  filter(country != "Kuwait")
view(life_data)

#Recreate graphics
ggplot(data = life_data) +
  scale_y_continuous(trans = "sqrt") +
  geom_point(mapping = aes(size = pop, x = lifeExp, y = gdpPercap, color = continent)) +
  facet_wrap(~ year, nrow = 1) +
  theme_bw() 

ggplot(data = life_data) +
  scale_y_continuous(trans = "sqrt") +
  geom_point(mapping = aes(x = year, y = gdpPercap, color = continent)) +
  geom_line(mapping = aes(x = year, y = gdpPercap, color = continent, group = country )) +
  facet_wrap(~ continent, nrow = 1) +
  xlab("Year") + ylab("GDP per capita") +
  summarise(Weighted_Mean = weighted.mean(year, gdpPercap, na.rm = TRUE),
                                          gdpPercap = sum(continent, na.rm = TRUE))
  theme_bw() 

