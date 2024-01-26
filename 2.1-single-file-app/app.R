# load packages ----
library(shiny)
library(DT)
library(palmerpenguins)
library(tidyverse)

# user interface ----
ui <- fluidPage(
  
  # app title ---
  tags$h1("2.2 Penguins App"),
  
  # app subtitle
  h4(strong("Exploring Antarctic Penguin Data")),
  
  # body mass slider input ----
  sliderInput(inputId = "body_mass_input",
              label = "Select a range of body masses (g):",
              min = 2700, max = 6300,
              value = c(3000,4000)), #setting 2 values gives us a range
  
  # body mass plot output
  plotOutput(outputId = "bodyMass_scatterplot_output"),
  
  # year checkbox input ----
  checkboxGroupInput(inputId = "year_input", label = "Select year(s):",
                     choices = c("2007", "2008", "2009"),
                     selected = c("2007", "2008")),
  
  # year DT output ----
  DT::dataTableOutput(outputId = "penguin_DT_output")
  
)

# server ----
server <- function(input, output) {
  
  # render penguin scatterplot ----
  output$bodyMass_scatterplot_output <- #code to generate plot
    
    renderPlot({
      
      # filter body masses ----
      body_mass_df <- reactive({ #create reactive df based on inputs
        penguins %>%
          filter(body_mass_g %in% #filter body mass
                   c(input$body_mass_input[1]:input$body_mass_input[2])) #for upper and lower slider
      }) 
      
      # add ggplot code here
      ggplot(na.omit(body_mass_df()), #reactive df must be followed by parenthesis
             aes(x = flipper_length_mm, y = bill_length_mm,
                 color = species, shape = species)) +
        geom_point(size = 5, alpha = 0.8) +
        scale_color_manual(values = c("Adelie" = "#ffb3c1", "Chinstrap" = "#c9184a", 
                                      "Gentoo" = "#ff4d6d")) +
        scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, 
                                      "Gentoo" = 15)) +
        labs(x = "Flipper Length (mm)",
             y = "Bill Length (mm)",
             color = "Penguin Species",
             shape = "Penguin Species") +
        theme_minimal() +
        theme(legend.position = c(0.85, 0.2),
              legend.background = element_rect(color = "White"))
    })
  
  # filter for years ----
  years_df <- reactive({
    penguins %>% 
      filter(year %in% c(input$year_input))
    })
  
  # render the DT ----
  output$penguin_DT_output <- DT::renderDataTable({
    
    DT::datatable(years_df(),
                  options = list(pagelength = 10),
                  rownames = FALSE)
    
  })
}

# combine ui and server into app ----
shinyApp(ui = ui, server = server)

