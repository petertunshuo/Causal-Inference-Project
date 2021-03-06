# Builds a bar graph with total arrests on the y axis and race/gender on the
# x axis. Refer to my presentation on graphing for more detail.

library(ggplot2)
library(tidyverse)
NLSY97_clean <- read.csv(here("data/NLSY97_clean.csv"))
NLSY97_clean%>%
  group_by(race, gender) %>%
  summarize(incarcerated = mean(incarcerated)) %>%
  ggplot(aes(race, incarcerated, fill = gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    x = "Race", 
    y = "Incarceration Rates", 
    fill = "Gender",
    title = "Incarceration Rates in 2002 by Race and Gender") +
  theme_minimal() +
  scale_fill_economist()

ggsave("figures/incarcerations_by_racegender.png", width=8, height=4.5)