library(tidyverse)
library(dplyr)
library(data.table)

diamonds

diamonds%>%
  select(carat,cut,price)%>%
  filter(cut == "Premium")%>%
  filter(price > 7000 & price < 10000)%>%
  arrange(desc(carat))%>%
  slice(1:20)

library(data.table)

# Convert diamonds dataset to data.table
diamonds <- as.data.table(diamonds)

# Select columns carat, cut, and price
diamonds_subset <- diamonds[, .(carat, cut, price)]
diamonds_subset <- diamonds_subset[cut == "Premium" & price > 7000 & price < 10000]
diamonds_subset <- diamonds_subset[order(-carat)]
result <- diamonds_subset[1:20]
print(result)
