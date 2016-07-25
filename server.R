rm(list = ls())
library(shiny)
library(dplyr)
library(ggvis)
library(plotly)
library(shinyjs)
Logged <- FALSE
shinyServer(function(input, output,session) {

  source('charts.R')
  
  observeEvent(input$"ui1Output-confirm", {
      Logged <<- TRUE
    })
  
  observe({
    input$"ui1Output-confirm"
    
    if (Logged == FALSE) {
      
      output$page <- renderUI({ 
        ui1Output('ui1Output') 
        })
      
      output$lsuId <- renderText({ 
        input$lsuId 
        })
      
    }
    if (Logged == TRUE) 
    {
      output$page <- renderUI({ ui2 })
    }
  })
 
 callModule(ui1,'ui1') 
 callModule(sideMenu,'sideMenu') 

})
