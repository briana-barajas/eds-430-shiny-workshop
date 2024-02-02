server <- function(input, output) {
  
  # filter lake data ----
  filtered_lakes_df <- reactive ({
    
    lake_data %>% 
      filter(elevation >= input$elevation_slider_input[1] & elevation <= input$elevation_slider_input[2]) %>% 
      filter(avg_depth >= input$depth_slider_input[1] & avg_depth <= input$depth_slider_input[2]) %>% 
      filter(avg_temp >= input$temp_slider_input[1] & avg_temp <= input$temp_slider_input[2])
    
  })
  
  
  
  # build leaflet map ----
  output$lake_map_output <- renderLeaflet({
    
    leaflet() %>% 
      
      # add tiles
      addProviderTiles(providers$Esri.WorldImagery) %>% 
      
      # set view over AK
      setView(lng = -152.048442, lat = 70.249234, zoom = 6) %>% 
      
      # add mini map
      addMiniMap(toggleDisplay = TRUE, minimized = TRUE) %>% 
      
      # add markers
      addMarkers(data =  filtered_lakes_df(),
                 lng = filtered_lakes_df()$longitude, lat = filtered_lakes_df()$latitude,
                 popup = paste("Site Name:", filtered_lakes_df()$site, "<br>",
                               "Elevation:", filtered_lakes_df()$elevation, "meters (above SL)", "<br>",
                               "Avg Depth:", filtered_lakes_df()$avg_depth, "meters", "<br>",
                               "Avg Lake Bed Temperature:", filtered_lakes_df()$avg_temp, "deg Celsius"))
    
  })
  
}