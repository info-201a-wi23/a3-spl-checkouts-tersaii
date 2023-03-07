library(dplyr)
library(readr)
library(stringr)
library(ggplot2)
library(styler)

checkouts <- read_csv("~/a3-data/2022-2023-All-Checkouts-SPL-Data.csv")
ranking <- checkouts %>%
  group_by(CheckoutYear, MaterialType, Title, Subjects, Creator) %>%
  summarise(checkouts = sum(Checkouts)) %>%
  arrange(-checkouts)
refined_ranking <- ranking %>% filter(checkouts >= 3933 & checkouts <= 19040)

ggplot(refined_ranking, aes(x = "", y = checkouts, fill = MaterialType)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(
    x = " ",
    y = " ",
    title = "Distribution of the Most Checkout Material Types of 2022",
    fill = "Material Category"
  )