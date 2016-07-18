#ui2 <- function(){tagList(tabPanel("Test"))}

source('sidebarMenu.R')  
ui2 <- shinyUI(fluidPage(
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