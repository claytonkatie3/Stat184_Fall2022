# how does the ordered structure of height vary by the family? 
# role of the person 
# plan 
## data set, /Users/katie.clayton/Documents/STAT 184 family heights.xlsx/Users/katie.clayton/Documents/STAT 184 family heights.xlsx
## load packages (ggplot2, esquisse )
## Aim: rank of heights by family role
## Geometry: box plot
## Mappings: family role, heights

## code
STAT_184_family_heights <- read.table(
  file = "/Users/katie.clayton/Documents/STAT 184 family heights.xlsx"
  header = TRUE,
  sep = ","
)

library (ggplot2)
library(esquisse)

esquisse::esquisser(data = STAT_184_family_heights, viewer = "browser")

ggplot(
  data = STAT_184_family_heights,
  mapping = aes(x = `family role`, y = height)
  ) +
  geom_boxplot(fill = "#FF69B4") +
  theme_minimal()+
  ylab("Height (inches)")
a