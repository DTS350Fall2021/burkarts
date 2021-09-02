library(tidyverse)

urlfile="https://github.com/WJC-Data-Science/DTS350/raw/master/coral.csv"
mydata <- read_csv(url(urlfile))

dim(mydata)
str(mydata)

head(mydata)
tail(mydata)

ggplot(data = mydata, aes(fill = Event)) +
  geom_col(mapping = aes(x = Year, y = Value))
