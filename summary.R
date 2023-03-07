library(dplyr)
library(readr)
library(stringr)

five_checkouts <- read_csv("~/a3-data/2013-2023-5-Checkouts-SPL.csv")

#tracking kevin kwan, author of Crazy Rich Asians, sales over the years.
kwan <- checkouts %>% filter(Creator == "Kevin Kwan")
kwan_trends <- kwan %>% group_by(CheckoutYear, MaterialType) %>% summarise(checkouts = sum(Checkouts))

#year with the most amount of checkouts (2019)
highest_year <- kwan_trends %>% filter(checkouts == max(checkouts, na.rm = FALSE))

#year with the least amount of checkouts (2013,2023)
lowest_year <- kwan_trends %>% filter(checkouts == min(checkouts, na.rm = FALSE))

#average checkouts over the years (3861)
avg <- mean(kwan_trends$checkouts) 

#most common material type for checkouts
kwan_ebook <- kwan_trends %>% filter(MaterialType == "EBOOK")
ebook_total <- sum(kwan_ebook$checkouts)
kwan_audio <- kwan_trends %>% filter(MaterialType == "AUDIOBOOK")
audio_total <- sum(kwan_audio$checkouts)




