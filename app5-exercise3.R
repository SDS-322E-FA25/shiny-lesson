# Exercise:
# Debug this Shiny app, so that it works!
# There are three bugs in the code.
# The first bug is in line 43
# The second bug is in line 49.
# The third bug is in line 64.

library(shiny)
library(bslib)
library(tidyverse)
library(ggthemes)

ui <- page_sidebar(
  
  title = "Penguins Dataset Scatter Plots",
  
  sidebar = sidebar(
    selectInput( 
      inputId = "xaxis", 
      "Select variable (X-axis):", 
      list("Flipper Length" = "flipper_len", 
           "Body Mass" = "body_mass", 
           "Bill Length" = "bill_len", 
           "Bill Depth" = "bill_dep") 
    ),
    selectInput( 
      inputId = "yaxis", 
      "Select variable (Y-axis):", 
      list("Flipper Length" = "flipper_len", 
           "Body Mass" = "body_mass", 
           "Bill Length" = "bill_len", 
           "Bill Depth" = "bill_dep"),
      selected = "body_mass"
    )
    
  ),
  
  plotOutput(outputId = "scatterPlot")
  
)

server <- function(input, output) {
  output$scatter_plot <- renderPlot({

    penguins_clean <- penguins |> 
      drop_na()
    
    penguins_clean |> 
      ggplot(aes(x = penguins_clean[ ,input$xaxis], y = penguins_clean[ ,input$xaxis])) +
      geom_point(aes(color = species), size = 3) +
      scale_color_brewer(palette = "Dark2") +
      labs(x = input$xaxis, y = input$yaxis, color = NULL) +
      theme_few() +
      theme(axis.text.x = element_text(size = 18),
            axis.text.y = element_text(size = 18),
            axis.title.x = element_text(size = 18),
            axis.title.y = element_text(size = 18),
            legend.text = element_text(size = 18))
    
  })
  
}

shinyApp(ui)

