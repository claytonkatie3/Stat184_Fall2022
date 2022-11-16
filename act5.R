library(readxl)
Army_Marital_Status <- read_excel("~/Documents/Army Marital Status.xlsx")
View(Army_Marital_Status)  
str(Army_Marital_Status)

esquisse::esquisser(data = Army_Marital_Status, viewer = "browser")

Army_Marital_Status$Size <- parse_number(Army_Marital_Status$Size)

# import data and install the piping package
library(ggplot2)
library(palmerpenguins)
data(penguins)
library(dplyr)

# plan

# compare difference between the body mass of males and females for each species

# geometry: box plot

# differentiate sex using colors

# mappings: species, body_mass_g, sex 

ggplot(penguins) +
  aes(x = species, y = body_mass_g, colour = sex) +
  geom_boxplot(fill = "#112446") +
  scale_color_hue(direction = 1) +
  theme_minimal()

# plan
# use three attributes to find a trend of the price of the diamond
# geometry: scatterplot, including a line of best fit
# mappings: carat, price, color


# this is correct one
# filter data so there is no more than four groupings on one graph
library(ggplot2)
data(diamonds)
library(dplyr)
diamonds %>%
  filter(color %in% c("J", "E", "I")) %>%
  
  # create graph using ggplot and assign variables 
  ggplot(
    mapping = aes(x = carat, y = price, colour = color)
  ) +
  
  # establish size for the line of best fit and the points, as well as shape 
  # for points
  geom_point(shape = "circle", size = 1.5) +
  geom_smooth(span = 0.75, se = FALSE) +
  
  # give each color a color which will display the legend
  scale_color_manual(
    values = c(D = "#0D0B0C",
               F = "#888386",
               G = "#00A7FF",
               H = "#FF8E00", 
               J = "#000000",
               E = "#8A8591",
               I = "#DC9423")
  ) +
  
  # label the axis, add a title
  labs(
    x = "Weight of Diamond (carats)",
    y = "Price of Diamond (dollars)",
    title = "Price of Diamond (dollars) vs. Color and Weight (carats)"
  )+
  theme_minimal()

# create second graph with the remaining four variables
library(ggplot2)
data(diamonds)
library(dplyr)
diamonds %>%
  filter(color %in% c("D", "F", "G", "H")) %>%
  
  # create graph using ggplot and assign variables
  ggplot(
    mapping = aes(x = carat, y = price, colour = color)
  ) +
  
  # establish size for the line of best fit and the points, as well as shape
  # for points
  geom_point(shape = "circle", size = 1.5) +
  geom_smooth(span = 0.75, se = FALSE) +
  
  # give each color a color which will display the legend
  scale_color_manual(
    values = c(D = "#0D0B0C",
               F = "#888386",
               G = "#00A7FF",
               H = "#FF8E00", 
               J = "#000000",
               E = "#8A8591",
               I = "#DC9423")
  ) +
  
  # label the axis, add a title
  labs(
    x = "Weight of Diamond (carats)",
    y = "Price of Diamond (dollars)",
    title = "Price of Diamond (dollars) vs. Color and Weight (carats)"
  )+
  theme_minimal()

# plan
# use three attributes to find a trend of the price of the diamond
# geometry: scatterplot, including a line of best fit
# mappings: carat, price, color
library(ggplot2)
data(diamonds)
library(dplyr)
ggplot(diamonds) +
  aes(x = carat, y = price, group = color) +
  geom_point(shape = "circle", size = 1.5, colour = "#4682B4") +
  theme_minimal()

ggplot(penguins) +
  aes(x = species, y = body_mass_g, colour = sex) +
  geom_boxplot(fill = "#112446") +
  scale_color_hue(direction = 1) +
  theme_minimal()

# filter out the NA sex values
penguins %>%
  filter(!is.na(sex)) %>%
  
  # use ggplot function to create the plot, assign attributes to each 
  ggplot(
    mapping = aes(x = species, y = body_mass_g, colour = sex)
  ) +
  geom_boxplot(fill = "#112446") +
  scale_color_hue(direction = 1) +
  
  # insert labels and add a title
  # specify that color pertains to sex
  labs(
    x = "Penguin Species",
    y = "Body Mass (grams)",
    title = "Body Mass of Male and Female Penguins vs Penguin Species",
    color = "Sex"
  )+
  theme_minimal()

# add in range of y values so all the data fits on the graph
penguins_data + ylim(2000,7000)