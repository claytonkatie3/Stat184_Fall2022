library(ggplot2)
data(diamonds)

library(ggplot2)
data(penguins)

library(palmerpenguins)
library(ggplot2)
library(palmerpenguins)
library(dplyr)

penguins_data <- penguins %>%
  filter(!is.na(sex)) %>%
  
  ggplot(
    mapping = aes(x = species, y = body_mass_g, colour = sex)
  )+
  
  geom_boxplot(fill = "#000000")+
  scale_color_hue(direction = 1)+
  
  labs(
    x = "Penguin Species",
    y = "Body Mass (grams)",
    title = "Body Mass of Male and Female Penguins vs Penguin Species",
    color = "Sex"
  )+
  theme_minimal()

  penguins_data + ylim(2000,7000)
 
  penguins %>%
    filter(!is.na(sex)) %>%
    ggplot(
      mapping = aes(x = body_mass_g, y = species, colour = sex) 
    ) +
    geom_boxplot(fill = "#112446") +
    scale_color_hue(direction = 1) +
    labs(
      x = "Penguin Species",
      y = "Body Mass (grams)",
      title = "Body Mass of Male and Female Penguins vs Penguin Species",
      color = "Sex"
    )+
    theme_minimal()
    penguins_data + ylim(2000,7000)
    
    penguins %>%
      filter(!is.na(sex)) %>%
      
      ggplot(
        mapping = aes(x = body_mass_g, y = species, colour = sex)
      ) +
      geom_boxplot(fill = "#112446") +
      scale_color_hue(direction = 1) +
      
      # insert labels 
      # specify that color pertains to sex
      labs(
        x = "Penguin Species",
        y = "Body Mass (grams)",
        title = "Body Mass of Male and Female Penguins vs Penguin Species",
        color = "Sex"
      )+
      theme_minimal()
    
    # add in range of y values
    penguins_data + ylim(2000,7000)
    
    # import data and install the piping package
    library(ggplot2)
    library(palmerpenguins)
    library(dplyr)

    # filter out the NA sex values
    penguins %>%
      filter(!is.na(sex)) %>%
      
      # use ggplot function to create the plot, assign attributes to each 
      ggplot(
        mapping = aes(x = body_mass_g, y = species, colour = sex)
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
   
    #  
    ggplot(diamonds) +
      aes(x = carat, y = price, group = color) +
      geom_point(shape = "circle", size = 1.5, colour = "#4682B4") +
      theme_minimal()    