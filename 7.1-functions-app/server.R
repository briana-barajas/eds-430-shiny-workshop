server <- function(input, output) {

  # render the scatter plot output ----
  output$penguin_scatterplot_output <- build_penguin_scatterplot(input)
  
  
  # render the histogram output ----
  output$penguin_histogram_output <- build_penguin_histogram(input)
  
} # END server