#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# libraries
library(shiny)
library(tidyverse)
library(tidyquant)
library(ggplot2)
library(plotly)


# get stock symbols
stock_symbols <- c("AMZN", "FB", "NFLX", "GOOGL")

# Define UI for application
ui <- fluidPage(
  titlePanel("Stock Market Returns: NYSE"),
  
  
  # Sidebar with a slider input
  sidebarLayout(
    inputPanel(
      selectInput("stock1",
                  "Stock 1:",
                  stock_symbols,
                  selected = stock_symbols[1],
                  ),
      selectInput("stock2",
                  "Stock 2:",
                  stock_symbols,
                  selected = stock_symbols[2],
      )
    ),
    # Show plot + instructions
    mainPanel("",
      plotlyOutput("p"),
      "INSTRUCTIONS:
      Use the drop-down menus to select two stocks from the FANG stocks group to review. FANG refers to the four prominent American Technology companies: Facebook, Amazon, Netflix, and Google.
      The plot will update to show the period returns in a monthly periodicity using adjusted stock prices.
      "
    )
  )
)

