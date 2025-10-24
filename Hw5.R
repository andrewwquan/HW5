library(tidyverse)
library(ggplot2)

Chicago <- read_csv('Chicago.csv') %>%
  select(Player, Age, MP, Gls...9) %>% 
  rename(Goals = Gls...9)

Bay <- read_csv('Bay.csv') %>%
  select(Player, Age, MP, Gls...9) %>% 
  rename(Goals = Gls...9)

AngelCity <- read_csv('AngelCity.csv') %>%
  select(Player, Age, MP, Gls...9) %>% 
  rename(Goals = Gls...9)

teams <- list(Chicago = Chicago, Bay = Bay, AngelCity = AngelCity)
Players <- bind_rows(teams, .id = "teamname")

ggplotplayer = ggplot(Players)
ggplotplayer + geom_histogram(aes(x = Age) )
ggplotplayer + geom_point(aes(x = MP, y = Goals, color = (str_trim(Player) == "Alyssa Thompson"))) + labs(color = "Alyssa Thompson")

