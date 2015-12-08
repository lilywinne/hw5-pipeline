library(plyr)
library(dplyr)
library(ggplot2)
library(gapminder)
library(tidyr)

gapminder <- read.delim("gapminder.tsv")
nlevels(gapminder$continent)
#drop oceania
d_continent<-gapminder %>% 
  filter(continent != "Oceania") 
d_continent.clean<-d_continent %>% 
  droplevels
le.max<- d_continent.clean %>%
  group_by(country) %>%
  summarize(max_le = max(lifeExp))

#reorder the data
d_continent.clean.r<- d_continent.clean %>%
  mutate(country = reorder(country, lifeExp, max))
le.max.r <- le.max %>%
  mutate(country = reorder(country, max_le))
le.max.r<- le.max %>%
  mutate(country = factor(country, levels = levels(d_continent.clean.r$country)))


## write data to file
write.table(d_continent.clean.r, "drop_clean_gap.tsv", quote = FALSE,
            sep = "\t", row.names = FALSE)
