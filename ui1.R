library(shinyjs)
source('consentForm.R')
ui1Output <-  function(id, label = "ui1") {
  
  ns <- NS(id)
  
  shinyUI(fluidPage(
    useShinyjs(),
    column(5, offset = 3,
    titlePanel("Consent form"),
    consentForm,
    column(6,offset = 2,
    div(
      id = ns("form"),
      textInput(ns("lsuId"), "LSU ID", ""),
      textInput(ns("age"), "Age", ""),
      selectInput(ns("gender"), "Select your gender",
                  c("",  "Male", "Female")),
      actionButton(ns("confirm"), "Submit", class = "btn-primary")
    ))
  )))
}

ui1 <- function(input, output, session) {
  observe({

    A <- reactive({all(input$"ui1Output-lsuId" !='', input$"ui1Output-age"!='')})
    print(A())
    shinyjs::toggleState(id = "ui1Output-confirm", condition = A())
  })
}