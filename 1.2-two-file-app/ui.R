# user interface ----
ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # (PAGE 1) Intro tabPanel ----
  tabPanel(title = "About this page",
           
           "background info goes here"), #END (PAGE 1) Intro tabPanel
  
  # (PAGE 2) Data viz tabPanel -----
  tabPanel(title = "Explore the Data",
           
           #tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tab panel ----
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout ----
                      sidebarLayout(
                        
                        # trout sidebarPanel ----
                        sidebarPanel(
                          
                          # channel type pickerinput ----
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s):",
                                      choices = unique(clean_trout$channel_type),
                                      selected = c("pool"),
                                      
                                      # add select/deselect all option
                                      options = pickerOptions(actionsBox = TRUE),
                                      
                                      multiple = TRUE), # END trout channel pickerinput
                          
                          # section checkboxGroupButtons ----
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select sampling section(s):",
                                               choices = c("clear cut forest", "old growth forest"),
                                               selected = c("clear cut forest", "old growth forest"),
                                               individual = FALSE, #puts buttons next to each other
                                               justified = TRUE, #width of buttons fill width of panel
                                               size = "sm",
                                               checkIcon = list(yes = icon("check"))
                          ) # END section checkboxGroupButtons
                          
                        ), # END trout sidebarPanel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          # trout scatterplot output ----
                          plotOutput(outputId = "trout_scatterplot_output")
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguin tab panel ----
             tabPanel(title = "Penguin",
                      
                      #penguin sidebarLayout ----
                      sidebarLayout(
                        
                        # penguin sidebarPanel ----
                        sidebarPanel(
                          
                          "penguin inputs will live here"
                          
                        ), # END penguin sidebarPanel
                        
                        # penguin mainPanel ----
                        
                        mainPanel(
                          
                          "this is where my penguin output will live"
                          
                        ) # END penguin mainPanel
                        
                      ) # END penguin sidebarLayout
                      
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
  ) # END (PAGE 2) data viz tabPanel
  
) # END navbarPage