
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggvis)
shinyUI(fluidPage(

  # Application title
  titlePanel("2D vs 3d graphs"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(

    ),

    # Show a plot of the generated distribution
    mainPanel(
      uiOutput('2d'),
      ggvisOutput('ggvis')
    )
  )
))
