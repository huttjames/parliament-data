# Load necessary libraries

library(shiny)
library(shinythemes)
library(vembedr)
library(tidyverse)

make_plot_master <- function(){ggplot(iris, aes(Sepal.Length, Sepal.Width)) + geom_point()}

# Define UI for application that draws a histogram
ui <- fluidPage(fluidPage(theme = shinytheme("flatly"),
                          
                          # Adding title and favicon
                          
                          HTML('<script> document.title = "Parliament Speaks"; </script>'),
                          tags$head(tags$link(rel="shortcut icon", href="icon.ico")),
  navbarPage(
      "Parliament Speaks",
      tabPanel("4",
               sidebarLayout(
                   sidebarPanel(
                    htmlOutput("about_me"), 
                    img(src="headshot.jpg",width="100%"), 
                    width = 3),
                   mainPanel(
                       plotOutput("netwPlot")
                   ))),
      tabPanel("3"),
      tabPanel("2"),
      tabPanel("1")
  )
))

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$netwPlot <- renderPlot({make_plot_master()}, width = 900, height = 900, execOnResize = TRUE)

    output$about_me <- renderUI({HTML("<b> About the Developer </b> <br/><br/>")})
}

# Run the application 
shinyApp(ui = ui, server = server)
