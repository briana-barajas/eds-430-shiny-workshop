# load packages ----
library(tidyverse)
library(leaflet)
library(here)

# read in data ----
lake_data <- read_csv(here("shinydashboard", "data", "lake_processed.csv"))

# practice filtering ---
filtered_lakes <- lake_data %>% 
  filter(elevation >=8 & elevation <= 20) %>% 
  filter(avg_depth >= 2 & avg_depth<= 3) %>% 
  filter(avg_temp >= 4 & avg_temp <= 6)

# build leaflet map ----
leaflet() %>% 
  
  # set base map
  addProviderTiles(providers$Esri.WorldImagery) %>% 
  
  # set zoom so map starts in area where our sites are
  setView(lng = -152.05, lat = 70.25, zoom = 6) %>% 
  
  # add inset map with bounding box around our area of interest
  addMiniMap(toggleDisplay = TRUE, minimized = FALSE) %>% 
  
  # add markers with our data
  addMarkers(data = filtered_lakes,
             
             # define lat/long columns
             lng = filtered_lakes$longitude, lat = filtered_lakes$latitude,
             
             # add popup label
             popup = paste0(
               'Site Name: ', filtered_lakes$site, '<br>',
               'Elevation: ', filtered_lakes$elevation, " meters (above SL)", "<br>",
               'Average Depth: ', filtered_lakes$avg_depth, " meters", "<br>",
               'Average Lake Bed Temperature: ', filtered_lakes$avg_temp, 'º'
             )) 
  # 
