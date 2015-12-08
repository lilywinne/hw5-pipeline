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


#reorder the data
d_continent.clean.r<- d_continent.clean %>%
  mutate(country = reorder(country, lifeExp, max))


## write data to file
write.table(d_continent.clean.r, "drop_clean_gap.tsv", quote = FALSE,
            sep = "\t", row.names = FALSE)
