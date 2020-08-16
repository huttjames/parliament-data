# Load necessary libraries

library(shiny)
library(shinythemes)
library(vembedr)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(fluidPage(theme = shinytheme("flatly"),
                          
                          # Adding the favicon using code from Bridger Gordons project for the HTML
                          
                          HTML('<script> document.title = "Parliament Speaks"; </script>'),
                          tags$head(tags$link(rel="shortcut icon", href="icon.ico")),
                          navbarPage(
                              "Parliament Speaks",
                              tabPanel("4"),
                              tabPanel("3"),
                              tabPanel("2"),
                              tabPanel("1")
                          ))
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
