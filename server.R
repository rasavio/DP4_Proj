#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(tidyquant)
library(ggplot2)
library(plotly)

# Define server logic required to design our shinyapp
serverLogic <- function(input, output) {
  
  output$g <- renderPlot({
    
    stock <- input$StockSymbol
    
    data <- FANG %>%
      filter(symbol == stock)
    
    # draw the plot  
    g <- data %>%
      ggplot(aes(x = date, y = adjusted, color = symbol)) +
      geom_line(size = 1) +
      labs(title = str_glue("Daily Stock Prices: {stock}"),
           x = "", y = "Adjusted Prices", color = "") +
      scale_y_continuous(labels = scales::dollar) +
      theme_tq() + 
      scale_color_tq()
    
    g
    
  })
  
}

# Add serverLogic
shinyServer(serverLogic)