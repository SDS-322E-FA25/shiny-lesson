# Exercise 1:
# Update the app from app2.R to build the histogram with geom_histogram() instead of hist()

library(shiny)
library(bslib)
library(tidyverse)

ui <- page_sidebar(
  
  title = "Hello Shiny!",
  
  sidebar = sidebar(
    sliderInput(
      inputId = "bins",
      label = "Number of bins:",
      min = 1,
      max = 50,
      value = 30
    )
  ),
  
  plotOutput(outputId = "distPlot")
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    
    # Your ggplot2 code goes here

    
    
  })
  
}

shinyApp(ui, server)

