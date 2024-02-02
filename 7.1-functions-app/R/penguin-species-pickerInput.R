penguinSpp_pickerInput <- function(plot_inputId){
  
  pickerInput(inputId = plot_inputId, 
              
              label = "Select a species:",
              
              choices = c("Adelie", "Chinstrap", "Gentoo"),
              
              selected = c("Adelie", "Chinstrap", "Gentoo"),
              
              options = pickerOptions(actionsBox = TRUE),
              
              multiple = TRUE)
  
}