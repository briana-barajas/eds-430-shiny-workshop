
build_penguin_scatterplot <- function(input){
  
  # filter penguin species (scatterplot) ----
  filtered_spp_scatterplot_df <- reactive ({
    
    penguins %>%
      
      # using input within function bc it's used already in the server
      filter(species %in% input$penguinSpp_scatterplot_input)
    
  })
  
  # render plot
  renderPlot({
    
    ggplot(na.omit(filtered_spp_scatterplot_df()),
           aes(x = bill_length_mm, y = bill_depth_mm,
               color = species, shape = species)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE, aes(color = species)) + 
      scale_color_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)", y = "Bill length (mm)",
           color = "Penguin species", shape = "Penguin species")
    
  })
  
}