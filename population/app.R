#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(numDeriv)
library(ggplot2)
library(deSolve)
require(ggforce)
require(devtools)
require(shinythemes)
library(shiny)

crc<-function(M,b,k){
  x <-(b/k)*M 
  x <- round(x)
  return(x)
}
# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("united"),
                # Application title
                titlePanel("Capture-Recapture"),
                sidebarPanel(
                    numericInput("obs1", "size of first sample:", 1, min = 0),
                    numericInput("obs2", "size of second sample:", 1, min = 0),
                    numericInput("obs3", "number of recaptured:", 1, min = 0)
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                    h5("Estimate of the population:", align = "left"),
                    verbatimTextOutput("val2"),
                )
)
        # Show a plot of the generated distribution
        

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$val2 <- renderText({
        crc(input$obs1,input$obs2,input$obs3)
        })
}

# Run the application 
shinyApp(ui = ui, server = server)
