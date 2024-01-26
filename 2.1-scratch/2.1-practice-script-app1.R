# laod pkgs ----
library(palmerpenguins)
library(tidyverse)

# filter penguins df for obs where body mass is >= 3000 & <= 4000
body_mass_df <- penguins %>%
  filter(body_mass_g %in% c(3000:4000))
  
# create scatterplot ----
ggplot(na.omit(body_mass_df), #reactive df must be followed by parenthesis
       aes(x = flipper_length_mm, y = bill_length_mm,
           color = species, shape = species)) +
  geom_point(size = 5, alpha = 0.8) +
  scale_color_manual(values = c("Adelie" = "#ffb3c1", "Chinstrap" = "#c9184a", 
                                "Gentoo" = "#ff4d6d")) +
  scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
  labs(x = "Flipper Length (mm)",
       y = "Bill Length (mm)",
       color = "Penguin Species",
       shape = "Penguin Species") +
  theme_minimal() +
  theme(legend.position = c(0.85, 0.2),
        legend.background = element_rect(color = "White"))

# selecting years for df
years_df <- penguins %>% 
  filter(year %in% 2007:2008)
