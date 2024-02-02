server <- function(input, output) {
  
  # penguin spp reactive df----
  penguin_spp <- reactive({
    
    na.omit(penguins) |> 
      filter(species %in% input$penguin_species) |> 
      select(species, island, bill_length_mm, bill_depth_mm)
    
  }) # END penguin spp reactive df
  
  
  # plot ----
  output$penguin_plot <- renderPlot({
    
    ggplot(penguin_spp(), aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
      geom_point() + 
      scale_color_manual(values = c("Adelie" = "#ffb3c1", "Chinstrap" = "#c9184a", "Gentoo" = "#ff4d6d")) +
      
      theme_minimal()
    
  }) # END plot 
  
}