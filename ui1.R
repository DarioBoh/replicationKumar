ui1UI <-  function(id, label = "ui1UI") {
  ns <- NS(id)
  shinyUI(fluidPage(
    
    fluidRow(
      column(5, offset = 3,
             titlePanel("Consent form"),
             consentForm
      )),    
    fluidRow(
      column(6, offset = 4,
             div(
               textInput(    ns("id"),  "LSU ID", ""),
               textInput(    ns("age"),     "Age", ""),
               selectInput(  ns("gender"),  "Select your gender", c("", "Male", "Female")),
               actionButton(ns("confirm"), "Submit", class='btn-primary')
             ))
    )
  ))
}

ui1 <- function(input, output, session) {
  
  cond <- reactive({ input$confirm})
  
  observe({
    toggleState("confirm", condition = nchar(input$id)>2 & nchar(input$age)>1 &  nchar(input$gender)>2)
  })
  
  return(cond)
  
}