
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
        uiOutput('2d'),
        ggvisOutput('ggvis')
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








