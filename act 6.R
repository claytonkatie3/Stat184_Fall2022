library(dcData)
library(dplyr)
BabyNames %>%
  group_by( First ) %>%
  summarise( votesReceived=n() )

library(dplyr)

Tmp <- group_by(BabyNames, year, sex)
  summarise( Tmp, totalBirths=sum(count))

library(dplyr)
topvoterCount <- Minneapolis2013 %>%
  group_by(Second) %>%
  filter(Second != "undervote") %>%
  summarize(
    count = n()
  )

arrangedtopvoterCount <- topvoterCount %>%
  arrange(desc(count))

View(arrangedtopvoterCount)

topevoterCount <- Minneapolis2013 %>%
  group_by(First, Second, Third) %>%
  filter(Second !)

Undervote <- Minneapolis2013 %>%
  group_by(First, Second, Third) %>%
  filter(First == "undervote"| Second == "undervote"| Third == "undervote") %>%
  summarize(
    count = n()
  )
View(Undervote)

undervoteCounts <- Minneapolis2013 %>%
  group_by(Second) %>%
  filter(Second == "undervote") %>%
  summarize(
    count = n()
  )
View(undervoteCounts)


FirstSecond <- Minneapolis2013 %>%
  group_by(First, Second) %>%
  summarize(
    count = n()
  )
FirstSecond <- FirstSecond %>%
  arrange(desc(count))
View(FirstSecond)

highestPrecinct <- Minneapolis2013 %>%
  group_by(Precinct) %>%
  summarize(
    count = n()
  )

highestPrecinct <- highestPrecinct %>%
  arrange(desc(count))
View(highestPrecinct)

#wrangle the data
library(dplyr)
# name variable
babyNames <- BabyNames %>%
  group_by(name,sex) %>%
  #choose specific names, 2 Female and 2 Male
  filter(name == "Bertha" | name == "Sarah" | name == "Martin" | name == "Tom")
  summarize(BabyNames, total = sum(count))
  View(babyNames)
  
#make female graph
  library(ggplot2)
#use wrangled data, choose only Female
  babyNames %>%
    filter(sex %in% "F") %>%
    ggplot(
      mapping = aes(x = year, y = count, colour = name, group = name)
    ) +
    geom_point(shape = "circle", size = 0.9) +
    #remove gray highlighted part of the lines
    geom_smooth(span = 0.15, se = FALSE) +
    scale_color_hue(direction = 1) +
    #label axis, title and legend
    labs(
      x = "Year",
      y = "Total Numbers of Specific Female Names",
      title = "The Popularity of Names Over Time",
      color = "Female Name"
    )+
    theme_minimal()+
    #label y axis so all the points fit on the graph
    ylim(0,30000)

  #make Male graph
  library(ggplot2)
  #use wrangled data, choose only Male
  
  #wrangle the data
  library(dplyr)
  # name variable
  babyNames <- BabyNames %>%
    group_by(name,sex) %>%
    #choose specific names, 2 Female and 2 Male
    filter(name == "Bertha" | name == "Sarah" | name == "Martin" | name == "Tom")
  summarize(BabyNames, total = sum(count))
  View(babyNames)
  
  #make Male graph
  library(ggplot2)
  #use wrangled data, choose only Male
  babyNames %>%
    filter(sex %in% "M") %>%
    ggplot(
      mapping = aes(x = year, y = count, colour = name, group = name)
    ) +
    geom_point(shape = "circle", size = 0.9) +
    geom_smooth(span = 0.15) +
    scale_color_hue(direction = 1) +
    #label axis, title and legend
    labs(
      x = "Year",
      y = "Total Numbers of Specific Male Names",
      title = "The Popularity of Names Over Time",
      color = "Male Name"
    )+
    theme_minimal()
  
  #make female graph
  library(ggplot2)
  #use wrangled data, choose only Female
  babyNames %>%
    filter(sex %in% "F") %>%
    ggplot(
      mapping = aes(x = year, y = count, colour = name, group = name)
    ) +
    geom_point(shape = "circle", size = 0.9) +
    #remove gray highlighted part of the lines
    geom_smooth(span = 0.15) +
    scale_color_hue(direction = 1) +
    #label axis, title and legend
    labs(
      x = "Year",
      y = "Total Numbers of Specific Female Names",
      title = "The Popularity of Names Over Time",
      color = "Female Name"
    )+
    theme_minimal()
   
    

 