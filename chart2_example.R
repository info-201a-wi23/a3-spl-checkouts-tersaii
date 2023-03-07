library(dplyr)
library(readr)
library(stringr)
library(ggplot2)

five_checkouts <- read_csv("~/a3-data/2013-2023-5-Checkouts-SPL.csv")

crz <- five_checkouts %>% filter(Creator %in% c("Kevin Kwan", "Donna Tartt"))
creatorcomp <- crz %>%
  group_by(CheckoutYear, Creator) %>%
  summarise(checkouts = sum(Checkouts))


ggplot(creatorcomp) +
  geom_line(aes(x = CheckoutYear, y = checkouts, colour = Creator)) +
  labs(
    title = "Sales between Donna Tartt and Kevin Kwan from 2013 to 2023",
    x = "Year",
    y = "Number of Checkouts",
    color = "Author"
  ) +
  scale_x_continuous(breaks = seq(2012, 2023, 1)) +
  scale_y_continuous(breaks = seq(0, 15000, 1000))
