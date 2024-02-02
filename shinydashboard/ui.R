# dashboard header ---------------------
header <- dashboardHeader(
  
  # title ----
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400 ) # END dashboard header

# dashboard sidebar --------------------
sidebar <- dashboardSidebar(
  
  # add pages to sidebar ----
  sidebarMenu(
    
    # add welcome page
    menuItem(text = "Welcome", tabName = "welcome", 
             
             # icons pulled from font awesome library
             icon = icon("star")),
    
    # add dashboard/map page
    menuItem(text = "Dashboard", tabName = "dashboard",
             icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

# dasboard body ------------------------
body <- dashboardBody(
  
  # set fresh theme ----
  fresh::use_theme("dashboard-fresh-theme.css"),
  
  # tabItems----
  tabItems(
    
    # add welcome tabItem ----
    tabItem(tabName = "welcome",
            
            # left-hand column ----
            column(width = 6,
                   
                   # background info box ----
                   box(width = NULL, # set to NULL to use width of column size
                       title = tagList(icon("water"),
                                       strong("Monitoring FIsh Creek Watershed")),
                       includeMarkdown("text/intro.md"),
                       
                       # add static image
                       tags$img(src = "FishCreekWatershedSiteMap_2020.jpg",
                                alt = "A map of Northern Alaska, showing Fish Creek Watershed located within the National Petroleum Reserve.",
                                style = "max-width: 100%;"),
                       tags$h6(tags$em("Map Source:", 
                                       tags$a(href = "http://www.fishcreekwatershed.org/", "FCWO")),
                               style = "text-align: center;")
                   ) # END background info box
                   
            ), # END left-hand column
            
            # right-hand column ----
            column(width = 6,
                   
                   # first fluid row ----
                   fluidRow(
                     
                     # citation box ----
                     box(width = NULL,
                         
                         title = tagList(icon("table"),
                                         strong("Data Source")),
                         includeMarkdown("text/citation.md")
                         
                     ) # END citation box
                     
                   ), # END fluidRow 1
                   
                   # second fluid row ----
                   fluidRow(
                     
                     # disclaimer box ----
                     box(width = NULL,
                         
                         title = tagList(icon("triangle-exclamation"),
                                         strong("Disclaimer")),
                         includeMarkdown("text/disclaimer.md")
                     ) # END disclaimer box
                     
                   ) # END fluidRow 2
                   
            ) # END right-hand column
            
    ), # END welcome tabItem
    
    # add dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input slider box ----
              box(width = 4, 
                  
                  title = tags$strong("Adjust lake parameter ranges:"),
                  
                  # sliderInputs ----
                  # elevation slider input
                  sliderInput(inputId = "elevation_slider_input",
                              label = "Elevation (meters above SL):",
                              min = min(lake_data$elevation),
                              max = max(lake_data$elevation),
                              value = c(min(lake_data$elevation), max(lake_data$elevation))),
                  
                  # depth slider input 
                  sliderInput(inputId = "depth_slider_input", 
                              label = "Average depth (meters):",
                              min = min(lake_data$avg_depth), max = max(lake_data$avg_depth),
                              value = c(min(lake_data$avg_depth), max(lake_data$avg_depth))),
                  
                  # temp slider input
                  sliderInput(inputId = "temp_slider_input", 
                              label = "Average lake bed temperature (degrees C):",
                              min = min(lake_data$avg_temp), 
                              max = max(lake_data$avg_temp),
                              value = c(min(lake_data$avg_temp), max(lake_data$avg_temp)))
                  
              ), # END input box
              
              # map box ----
              box(width = 8,
                  
                  # add title to map box
                  title = strong("Monitoring lakes within Fish Creek Watershed:"),
                  
                  # leaflet output ----
                  leafletOutput(outputId = "lake_map_output") %>% 
                    withSpinner(type = 1, color = 'seagreen3')
                  
              ) # END map box
              
            ) # END fluidRow
            
    ) # END dashboard tabItem
    
  ) # END tabItem(s)
  
) # END dashboardBody

# combine all into dashboard page ------
dashboardPage(header, sidebar, body)