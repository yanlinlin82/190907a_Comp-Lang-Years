library(tidyverse)

a <- tribble(
  ~lang,    ~start, ~end,
  "basic",  1996,   2005,
  "masm",   1997,   2004,
  "c",      1998,   2015,
  "pascal", 1998,   1999,
  "foxpro", 1999,   1999,
  "asp",    2000,   2003,
  "c#",     2003,   2009,
  "c++",    2003,   2019,
  "php",    2004,   2006,
  "r",      2008,   2019,
  "perl",   2011,   2019,
  "jsp",    2015,   2016
)

g <- a %>%
  ggplot(aes(y = reorder(lang, start))) +
  geom_segment(aes(x = start, xend = end, yend = lang)) +
  geom_point(aes(x = start), color = "red", size = 3) +
  geom_point(aes(x = end), color = "blue", size = 3) +
  scale_x_continuous(breaks = 1996:2019, minor_breaks = FALSE) +
  labs(x = "Year", y = "Language")
g %>% ggsave(filename = "plot.png", width = 10, height = 4)
