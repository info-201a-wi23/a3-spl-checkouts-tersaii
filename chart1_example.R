library(dplyr)
library(readr)
library(stringr)
library(ggplot2)

checkouts <- read_csv("D:/INFO201/2022-2023-All-Checkouts-SPL-Data.csv")
nfdata <- checkouts %>% filter(Subjects %in% c("Nonfiction", "Fiction"))
comparison <- nfdata %>%
  group_by(CheckoutMonth, Subjects) %>%
  summarise(checkouts = sum(Checkouts))


ggplot(comparison) +
  geom_line(aes(x = CheckoutMonth, y = checkouts, colour = Subjects)) +
  labs(
    title = "Checkouts in Fiction vs Nonfiction across 2022",
    x = "Month",
    y = "Number of Checkouts",
    color = "Genre"
  ) +
  scale_x_continuous(breaks = seq(1, 12, 1)) +
  scale_y_continuous(breaks = seq(50, 450, 50))
