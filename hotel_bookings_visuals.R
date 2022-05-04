## The scenario:
#  In this scenario, you are a junior data analyst working for a hotel booking company.
#  You have cleaned and manipulated your data, and gotten some initial insights you would like to share.
#  Now, you are going to create some simple data visualizations with the `ggplot2` package.
#  You will use basic `ggplot2` syntax and troubleshoot some common errors you might encounter.    

library(ggplot2)
library(tidyverse)
hotel_bookings <- read.csv("hotel_bookings.csv")
head(hotel_bookings)
glimpse(hotel_bookings)
colnames(hotel_bookings)
str(hotel_bookings)
View(hotel_bookings)

#  Stakeholder hypothesis:
#  "I want to target people who book early, and I have a hypothesis that people with children have to book in advance."
#  creating a scatter plot doisplaying lead time vs children  
plot_1 = ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = lead_time, y = children))

#  the x-axis, the plot shows how far in advance a booking is made,
#  with the bookings furthest to the right happening the most in advance
#  The plot shows the hypothesis is INCORRECT

#  the stakeholder wants to increase weekend bookings, an important source of revenue for the hotel
#  Your stakeholder wants to know what group of guests book the most weekend nights in order to target that group 
#  in a new marketing campaign. She suggests that guests without children book the most weekend nights. Is this true?
plot_2 = ggplot(data = hotel_bookings) +
  geom_point(mapping = aes(x = stays_in_weekend_nights, y = children))

#  the stakeholders hypothesis is true as displayed on plot_2

# optimising plot_1 and plot_2
#  plot_1.2
ggplot(data = hotel_bookings) +
  geom_col(mapping = aes(x = lead_time, y = children))

#  plot_2.2
ggplot(data = hotel_bookings) +
  geom_col(mapping = aes(x = stays_in_weekend_nights, y = children,colour=stays_in_weekend_nights))
