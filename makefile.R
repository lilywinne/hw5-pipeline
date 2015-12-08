## one script to rule them all

## clean out any previous work
outputs <- c("gapminder.tsv",                     # 00.R
             "drop_clean_gap.tsv.tsv",                   # 01.R
             list.files(pattern = "*.png$"))
file.remove(outputs)

## run my scripts
source("00.R")
source("01.R")
source("02.R")