rm(list = ls())
library(shiny)
library(dplyr)
library(ggvis)
library(plotly)
library(shinyjs)
Logged = T;
shinyServer(function(input, output,session) {

  source('datasets.R')
  source('ui1.R') #login page
  source('ui2.R') #experiment page
  
  source('charts.R')
  USER <- reactiveValues(Logged = Logged)

  
  
  observe({ 
    if (USER$Logged == FALSE) {
      if (!is.null(input$confirm)) {
        if (input$confirm > 0) {
          #Does lsuId need to be passed in a reactive function since is coming froma  module?
          
          lsuId <- reactive({ input$lsuId })
          print('input lsuiId', lsuId())
          age <- isolate(input$age)
          print('input age',age)
          if (length(lsuId()) > 0 & length(age) > 0) { USER$Logged <- TRUE }
        } 
      }
    }    
  })
  observe({
    if (USER$Logged == FALSE) {
      output$page <- renderUI({ 
        ns <- session$ns
        ui1Output('ui1Output') 
        })
      print('user is not logged')
      lsuId <- reactive({ input$lsuId })
      print(paste('input lsuId:',lsuId()))
      hh <- input$lsuId
      print(paste('input lsuId:',input$lsuId))
      
      
    }
    if (USER$Logged == TRUE) 
    {
      print('user is logged')
      output$page <- renderUI({ ui2 })
      #print(ui)
      
    }
  })
 
 callModule(ui1,'ui1') 
 callModule(sideMenu,'sideMenu') 
#  output$question <- renderText({ xy[1] })

})
