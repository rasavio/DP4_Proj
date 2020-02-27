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
library(plotly)
library(readr)


data <- read_rds("data.rds")

# Define server logic required to design our shinyapp
serverLogic <- function(input, output) {
  output$p <- renderPlotly({
   
    # Get data
    stocks <-
      c(input$stock1, input$stock2)
    
        # Draw plot
    g <- data %>%
      filter(symbol %in% stocks) %>%
      ggplot(aes(x = date, y = Ra, color = symbol)) +
      geom_line() +
      facet_wrap(. ~ symbol, ncol = 1, scales = "free_y") +
      theme_tq() +
      labs(
        title  = "",
        x      = "",
        y      = "",
        color  = ""
      
      ) +
      scale_color_tq()
    
    ggplotly(g) %>% layout(height = 400, width = 800)
    
  })
  
}

# Add serverLogic
shinyServer(serverLogic)