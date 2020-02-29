#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#
library(shiny)
library(tidyverse)
library(tidyquant)
library(ggplot2)
library(readr)
library(tseries)
library(forecast)

# load data: "stock.prices" from = "2010-01-01")
data <- read_rds("data.rds")

# Define server logic required to design our shinyapp
serverLogic <- function(input, output) {
  output$g <- renderPlot({
   
    # filter data for selected stock
    input_data <- data %>%
      filter(symbol == input$stock)
    
    # generate forecast
    fit <- auto.arima(input_data$close)
    
    forecast <- forecast(fit, h = input$periods)
    
    # draw plot
    g <- plot(forecast, ylab = "Closing Price", xlab = "Period")
    
    g
    
  })
  
}

# Add serverLogic
shinyServer(serverLogic)