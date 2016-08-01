
shinyServer(function(input, output) {
  
  cond <- callModule(ui1, "ui1")
  
  
  output$page <- renderUI({ui1UI('ui1')})
  
  observeEvent(cond(), {
    callModule(ui2, "ui2")
    output$page <- renderUI({ui2UI('ui2')})
  })
  
  
  
})


