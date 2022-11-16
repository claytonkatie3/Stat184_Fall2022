# plan
## how do the frequencies vary as we look at the pay grade, marital status, 
## and sex of members of the US Army?
# data set
# aim: variation of frequencies of pay grade, marital status and sex 
# geometry: histogram
# mappings: pay grade, marital status, sex, size

library (ggplot2)
library(esquisse)

esquisse::esquisser(data = Army_Marital_Status, viewer = "browser")
ggplot(Army_Marital_Status) +
  aes(x = Size) +
  geom_histogram(bins = 30L, fill = "#112446") +
  theme_minimal()

esquisse::esquisser(data = penguins)
ggplot(penguins)

ggplot(diamonds) +
  aes(x = carat, y = price, group = color) +
  geom_point(shape = "circle", size = 1.5, colour = "#4682B4") +
  theme_minimal()

ggplot(penguins) +
  aes(x = body_mass_g, y = species, colour = sex) +
  geom_boxplot(fill = "#112446") +
  scale_color_hue(direction = 1) +
  theme_minimal()