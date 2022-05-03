##  The scenario

#  In this scenario, you are a junior data analyst working for a hotel booking company. 
#  You have been asked to clean a .csv file that was created after querying a database to combine 
#  two different tables from different hotels. In order to learn more about this data, you are going to need 
#  to use functions to preview the data's structure, including its columns and rows.
#  You will also need to use basic cleaning functions to prepare this data for analysis.

library(tidyverse)
library(skimr)
library(janitor)
library(tidyverse)

#  importing the dataset from local space
bookings_df <- read_csv("hotel_bookings.csv")

#  familiarizing myself with the data
head(bookings_df)
str(bookings_df)
glimpse(bookings_df)
colnames(bookings_df)
skim_without_charts(bookings_df) #  to produce summaries without the spark graphs

View(bookings_df)

#  creating a dataframe with specific columns
focused_df = bookings_df %>% 
  select('hotel','is_canceled','lead_time')
View(focused_df)

#  some of the column names aren't very intuitive, rename them to make them easier to understand
focused_df %>% 
  select(hotel,is_canceled,lead_time) %>% 
  rename(hotel_type = hotel)

#  split or combine data in different columns
#  combine the arrival month and year into one column using unite()
mutated_df = bookings_df %>% 
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month", "arrival_date_year"), sep = " ")
View(mutated_df)

#  create a new column that summed up all the adults, children, and babies on a reservation for the total number of people
sum_per_party_df = bookings_df %>% 
  mutate(sum_guests=adults+children+babies)
View(sum_per_party_df)

#  total number of canceled bookings and the average lead time for booking
mutated_df = bookings_df %>% 
  mutate(sum_canceled = sum(is_canceled),avg_lead_time = mean(lead_time))
View(mutated_df)
