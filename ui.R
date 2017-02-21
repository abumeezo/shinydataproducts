library(shiny)
library(shinyjs)
shinyUI(fluidPage(
  titlePanel("Rusan's Quincunx"),
  sidebarLayout(
    sidebarPanel(
      h4("Select number of balls to run in machine:"),
      sliderInput("balls","",1,10000,1000),
      submitButton("Run!")
    ),
    mainPanel(
      plotOutput("plot1"),
      h5("Kurtosis of ball distribution (kurtosis of normal distribution is 3.0) = "),
      textOutput("text1")
    )
  )
)
)