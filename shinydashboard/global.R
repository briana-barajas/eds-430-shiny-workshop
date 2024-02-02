# load libraries
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet) # map
library(shinycssloaders) # loading icons
library(markdown)

# read in data ----
# avoid using `here` within apps, ok for wrangling but doesn't work in app files
lake_data <- read_csv("data/lake_processed.csv")

