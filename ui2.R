#ui2 <- function(){tagList(tabPanel("Test"))}

source('sidebarMenu.R')  
source('datasets.R')
ui2 <- shinyUI(fluidPage(
  # Application title
  titlePanel("App"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
sideMenuOutput('sideMenu')

),
    
    # Show a plot of the generated distribution
    mainPanel(
      uiOutput('2d'),
      ggvisOutput('ggvis')
    )
  )
))