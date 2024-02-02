# load packages -----------------
library(tidyverse)
library(here)
library(janitor)

# read in raw data 
lake_raw <- read_csv(here('raw_data/fcwo_lake_data.csv')) %>% 
  clean_names()

# avg depth & temperature -----
avg_depth_temp <- lake_raw %>% 
  
  # select columns of interest
  select(site, depth, bed_temperature) %>% 
  
  # removing missing values in depth col
  filter(depth != 'NaN') %>% 
  
  # removing missing values in bed temperature col
  drop_na(bed_temperature) %>% 
  
  # group by before calculating averages
  group_by(site) %>% 
  summarise(avg_depth = round(mean(depth), 2),
            avg_temp = round(mean(bed_temperature), 2))

# join to original df to get lat, long, elev ----
joined_df <- full_join(lake_raw, avg_depth_temp)

# unique lakes ----
unique_lakes <- joined_df %>% 
  
  # select columns of interest
  select(site, latitude, longitude, avg_depth, avg_temp, elevation) %>% 
  
  # grabs unique rows in df, removing repeat rows
  distinct()

# save processed data as new csv ----
write_csv(unique_lakes,
          file = here('shinydashboard/data/lake_processed.csv'))
