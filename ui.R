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
stock_symbols <- c("AAPL", "AMZN", "FB", "GOOG", "NFLX")

# Define UI for application
ui <- fluidPage(
  titlePanel("Forecasting FAANG Stock Prices"),
  
  # Sidebar with a slider input
  sidebarLayout(
    inputPanel(
      selectInput("stock",
                  "Select Stock:",
                  stock_symbols,
                  selected = stock_symbols[1],
                  ),
      numericInput("periods",
                  "Number of Periods",
                  value = 500,
                  min = 1
      )
    ),
    # Show plot + instructions
    mainPanel("",
      plotOutput("g"),
      "INSTRUCTIONS:
      FAANG refers to the prominent American Technology companies: Facebook, Amazon, Apple, Netflix, and Google.
      Select one of these stocks from the drop-down menu and a forecast of future closing prices will be generated.
      "
    )
  )
)

