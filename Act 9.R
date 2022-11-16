# load packages
library(rvest)
library(dplyr)
library(readr)
library(ggplot2)
library(tidyr)

# highest grossing movies data
highestgrossingMovies <- read_html(
  x = "https://www.boxofficemojo.com/chart/top_lifetime_gross/?area=XWW"
) %>%
  html_elements(css = "table") %>%
  html_table()
## use element 1

# rotten tomato ratings of the highest grossing movies data 
library(readxl)
rottenTomatoes <- read_excel("~/Desktop/rottenTomatoes.xlsx")
tomatoDataFrame <- data.frame(rottenTomatoes)

# column bind the box office gross using element 1
boxofficeGross <- bind_cols(highestgrossingMovies[[1]])

# join data 
MoviesInBoxOffice <- inner_join(
  x = boxofficeGross,
  y = tomatoDataFrame,
  by = ("Title" = "Title")
)


#library(esquisse)
#esquisse::esquisser(data = MoviesInBoxOffice, viewer = "browser")

# create the visualization
ggplot(MoviesInBoxOffice,
       mapping = aes(x = Rotten.Tomato.Rating, y = `Lifetime Gross`, colour = Title)
  ) +
  geom_point(shape = "circle", size = 4L) +
  scale_color_hue(direction = 1) +
  labs(
    x = "Rotten Tomato Rating",
    y = "Lifetime Gross"
  )+
  theme_minimal()

 