
sideMenuOutput <- function(id, label = "sideMenu") {
  # Create a namespace function using the provided id
  ns <- NS(id)
  
  tagList(
    textOutput(ns('question')),br(),
    textInput(ns("answer"), "Type your answer:"),
    br(),
    actionButton(ns("submit") , "Submit"),
    textOutput(ns('answer'))
  
  )
  
}


# rm(list = ls())
Answer = FALSE;


sideMenu <- function(input, output, session) {
  
  ANSWER <- reactiveValues(Answer = Answer)
  questNum <- as.integer(1)
  output$question <- renderText({ xy[questNum] })
  
  observeEvent(input$submit, {
    session$sendCustomMessage(type = 'testmessage',
                              message = 'Thank you for clicking')
         output$answer <- isolate(renderText({input$answer}))
         questNum <<- questNum + 1
         output$question <<- renderText({ xy[questNum] })
         print(questNum)
    
  })
}








# 
# 
# sideMenu <- tagList(
#   textOutput('question'),br(),
#   textInput("answer", "Type your answer:"),
#   br(),actionButton("submit", "Submit")
# )





