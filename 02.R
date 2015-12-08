library(plyr)
library(dplyr)
library(ggplot2)
library(gapminder)
library(tidyr)

d_continent.clean.r<- read.delim("drop_clean_gap.tsv")

#make the plot
pic1<-ggplot(d_continent.clean.r, 
            aes(x=year, y=log10(lifeExp), color=country)) +
  geom_point(aes(size=log10(pop))) +
  facet_wrap(~continent) + 
  geom_path() 
ggsave("lifeExp vs year.png", pic1)
countries<-c("China","United States")
china_us <- gapminder %>%
  filter(country %in% countries)
china_us.tidy <- china_us %>%
  gather(key = var, value = value, pop, lifeExp, gdpPercap)
pic2<-ggplot(china_us.tidy, aes(x = year, y = value,fill = country)) +
  scale_fill_manual(values = country_colors)+ 
  facet_wrap(~ var, scales="free_y") + 
  geom_point(pch=21)+ 
  geom_line()+
  scale_x_continuous(breaks = seq(1950, 2011, 15))
ggsave("China vs US", pic2)