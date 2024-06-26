# Setup

library(tidyverse)
library(readr)
library(plotly)
library(stringr)
library(tm)
# library(wordcloud) # If desired, for open source tool usage word cloud
library(scales)
library(showtext)

####
# Set primary school color and university name

primary_color <- '#9B0000'
dark_accent <- '#333333'
background_color <- '#F7F7F7'

uni_name <- 'UW-Madison'

####
# Set custom fonts for plots

font_add_google("Red Hat Text", family = "custom")

####
# Set custom themes for plots

bar_theme <- theme(legend.position = 'bottom',
      axis.ticks = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_line(color = dark_accent),
      panel.grid.minor.y = element_blank(),
      panel.background = element_rect(fill = background_color),
      legend.background = element_rect(fill = background_color),
      plot.background = element_rect(fill = background_color, 
                                     color = background_color))

bar_coord_flip_theme <- theme(axis.ticks = element_blank(),
                              panel.grid.major.y = element_blank(),
                              panel.grid.major.x = element_line(color = dark_accent),
                              panel.grid.minor.x = element_blank(),
                              panel.background = element_rect(fill = background_color),
                              legend.background = element_rect(fill = background_color),
                              plot.background = element_rect(fill = background_color, 
                                                             color = background_color))

lollipop_theme <- theme(legend.position = 'none',
                        axis.ticks.x = element_blank(),
                        panel.grid.major = element_blank(),
                        panel.background = element_rect(fill = background_color),
                        legend.background = element_rect(fill = background_color),
                        plot.background = element_rect(fill = background_color, 
                                                       color = background_color))

####
# Data loading and cleaning
survey_df <- read_csv("data/survey_data.csv")

# Extract survey results template - for convenience, eases reviewing questions 
# and question IDs

survey_template <- survey_df[1,] |> 
  unnest() |> 
  pivot_longer(
    cols = everything(),
    names_to = 'q_number',
    values_to = 'q_text'
  )

# Extract survey results data, keeping complete responses only

survey_results <- read_csv("data/survey_data.csv", 
                           col_names = FALSE, skip = 3) |> 
  tail(-2)

colnames(survey_results) <- survey_template$q_number

survey_results <- survey_results |> 
  filter(Finished == TRUE)
