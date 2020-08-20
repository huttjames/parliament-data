# Load necessary libraries

library(shiny)
library(shinythemes)
library(vembedr)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(fluidPage(theme = shinytheme("flatly"),
                          
# Adding title and favicon

HTML('<script> document.title = "Parliament Speaks"; </script>'),

tags$head(tags$link(rel="shortcut icon", href="icon.ico")),

# Setting up page layout

navbarPage("Parliament Speaks",
           tabPanel("3"),
           tabPanel("2"),
           tabPanel("1"),
           tabPanel("About",
             sidebarLayout(
               sidebarPanel(
                 htmlOutput("about_me"), 
                 img(src="headshot.jpg",width="100%"), 
                 htmlOutput("bioinfo"),
                 width = 4),
               mainPanel(
                 htmlOutput("proj_info")
               )
             )
          )
        )
))

# Define server logic required to draw a histogram
server <- function(input, output) {
  
    source("static_text.R")
    source("defaults.R")
    
    # Code for about page
    
    output$about_me <- about_me_header
    output$bioinfo <- bioinfo
    output$proj_info <- proj_info
}

# Run the application 
shinyApp(ui = ui, server = server)
