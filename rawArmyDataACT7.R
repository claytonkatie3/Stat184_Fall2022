## call the packages
library(dplyr)
library(knitr)
library(kableExtra)
library(janitor)
# load the rawArmyData
rawArmyData <- read.csv("~/Downloads/rawArmyData.csv")
data("rawArmyData", package = "ggplot2")
ArmyTable <- rawArmyData %>%
  # filter 0-2 out of pay grade 
  filter(payGrade %in% "O-2") %>%
  # put maritalStatus and sex inside the tabyl function
  tabyl(maritalStatus, sex) %>%
  # find the totals and percentages
  adorn_totals(where = c("row", "col")) %>%
  adorn_percentages(denominator = "all") %>%
  # set the decimals to 2 places
  adorn_pct_formatting(digits = 2) %>%
  # name the titles
  adorn_title(
    placement = "combined",
    row_name = "Marital Status",
    col_name = "Sex")

# formatting in relation to the ArmyTable created previously
formatArmy <- attr(ArmyTable, "core") %>%
  adorn_totals(where = c("row", "col")) %>%
  # use mutate to add the counts from the data set and add a , in larger numbers 
  mutate(
    across(where(is.numeric), format, big.mark = ",")
  )

armyFreqTable <- ArmyTable %>%
  # place the counts and percentages inside the same cell
  adorn_ns(position = "front", ns = formatArmy)

# improvements on the table
armyFreqTable %>%
  kable(
    # add title to the whole table
    caption = "Sex and Marital Status of Army Soldiers in Pay Grade O-2",
    # add grid lines
    booktabs = TRUE,
    # align the numbers and percentages under the column names
    align = c("l", rep("c", 6))
  ) %>%
  kableExtra::kable_styling(
    # show a difference in color between every other row
    bootstrap_options = c("striped", "condensed"),
    font_size = 18
  )
# view the polished table
View(armyFreqTable)

