
ui2UI <- function(id, label = "ui2UI") {
  source('charts.R')
  ns <- NS(id)
  shinyUI(fluidPage(
    
    titlePanel("App"),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
      sidebarPanel(
        #sideMenuOutput('sideMenu')
        tagList(
          textOutput(ns('question')),br(),
          textInput(ns("answer"), "Type your answer:"),
          br(),
          actionButton(ns("submit") , "Submit")
        )
      ),
      # Show a plot of the generated distribution
      mainPanel(
        tags$head(
          tags$script(src="jquery-3.1.0.slim.js")
          ),
        
        #code for recording mouse movements
        uiOutput('2d'),
        ggvisOutput('ggvis'),
        tags$div(id='log', log='value', "data-value"=''),
        tags$div(id='scrollMove', cumDistance='value', position='value'),
        tags$div(id='mouseMove', cumDistance='value', coorX="value",coorY='value'),
        tags$script(src="moustrack.js")
      )
    )
  ))}



ui2 <- function(input, output, session) {
  q <- 1
  output$question <-  renderText({ xy[q] })
  observeEvent(input$submit, {
    q <<- q +1
    output$question <- renderText({ xy[q] })
  })
  
  
}








