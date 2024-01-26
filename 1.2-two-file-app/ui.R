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
                          "trout inputs will live here"
                        ), # END trout sidebarPanel
                        
                        # trout mainPanel ----
                        mainPanel(
                          "this is where my trout output will live"
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguin tab panel ----
             tabPanel(title = "Penguin",
                      
                      "penguin viz goes here")
             
           ) # END tabsetPanel
           
  ) # END (PAGE 2) data viz tabPanel
  
) # END navbarPage