#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(tidyquant)


# Define UI for application
ui <- fluidPage(
  titlePanel("Stock Market Returns: FANG tech stocks"),
  
  # Sidebar with a slider input
  sidebarLayout(
    inputPanel(
      selectInput("StockSymbol",
                  "Stock:",
                  sort(FANG$symbol),
                  selected = sort(FANG$symbol)[2],
                  )
    ),
    # Show a plot of the generated distribution
    mainPanel("",
      plotOutput("g")
    )
  )
)


# Draws UI