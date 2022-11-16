## load necessary packages
library(ggplot2)
library(dplyr)
library(knitr)
library(kableExtra)
library(janitor)
# load diamonds data
data(diamonds)
# name variable
depthDiamonds <- diamonds %>%
  # choose cut and the depth which is z
  group_by(cut) %>%
  select(cut, z) %>%
  # input the 10 statistics needed, not forgetting na.rm = TRUE at the end of the line
  summarize(
    across(
      .cols = where(is.numeric),
      .fns = list(
        min = ~min(z, na.rm = TRUE), 
        Q1 = ~quantile(z, probs = 0.20, na.rm = TRUE),
        Q2 = ~quantile(z, probs = 0.40, na.rm = TRUE),
        median = ~median(z, na.rm = TRUE),
        Q3 = ~quantile(z, probs = 0.60, na.rm = TRUE),
        Q4 = ~quantile(z, probs = 0.80, na.rm = TRUE),
        max = ~max(z, na.rm = TRUE),
        sam = ~mean(z, na.rm = TRUE),
        sasd = ~sd(z, na.rm = TRUE)
      ),t
      round(digits = 2)
    ),
    # format the numbers so the big ones have a , if needed
    count = format(n(), big.mark = ","),
  )
# give the columns names
colnames(depthDiamonds) <- c("Cut", "Min", "1st Quintile", "2nd Quintile", "Median", "3rd Quintile", "4th Quintile", "Max", "Arithmetic Mean", "Arithmetic Standard Deviation", "Count")
# use piping and kable function to output the table 
depthDiamonds %>%
  kable(
        # add title, lines and aling the numbers with words
        caption = "Statistics of the Depth vs Cut of a Diamond",
        booktabs = TRUE,
        align = c("l", rep("c", 6))
      ) %>%
      kableExtra::kable_styling(
        bootstrap_options = c("striped", "condensed"),
        font_size = 16
  ) %>%
  kableExtra::kable_classic()


