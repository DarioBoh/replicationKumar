
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
rm(list = ls())
library(shiny)
library(dplyr)
library(ggvis)
library(plotly)
Logged = FALSE;
shinyServer(function(input, output) {

  source('datasets.R')
  source('ui1.R') #login page
  source('ui2.R') #experiment page
  
  source('charts.R')
  
  USER <- reactiveValues(Logged = Logged)
  observe({ 
    if (USER$Logged == FALSE) {
      if (!is.null(input$confirm)) {
        if (input$confirm > 0) {
          lsuId <- isolate(input$lsuId)
          age <- isolate(input$age)
          if (length(lsuId) > 0 & length(age) > 0) { USER$Logged <- TRUE }
        } 
      }
    }    
  })
  observe({
    if (USER$Logged == FALSE) {
      output$page <- renderUI({ div(class="outer",do.call(bootstrapPage,c("",ui1()))) })
    }
    if (USER$Logged == TRUE) 
    {
      output$page <- renderUI({ ui2 })
      #print(ui)
      
    }
  })
  
 callModule(sideMenu,'sideMenu') 
#  output$question <- renderText({ xy[1] })

})
