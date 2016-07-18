
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)
library(ggvis)
library(plotly)
shinyServer(function(input, output) {

source('datasets.R')


    # generate bins based on input$bins from ui.R
   
    all_values <- function(x) {
      if(is.null(x)) return(NULL)
      paste0(names(x), ": ", format(x), collapse = "<br />")}

     dt %>%   
    ggvis(x=~noiseLevel, y=~testScore, stroke=~temperature) %>% 
      layer_lines() %>% 
      layer_points(fill=~temperature) %>% 
      add_axis("y", orient = "right") %>% 
      add_axis("y", orient = "left") %>% 
      add_tooltip(all_values,'hover') %>% 
      scale_numeric("x", domain = c(0, 50)) %>% 
      scale_numeric("y", domain = c(0, 80)) %>% 
      bind_shiny('ggvis','2d')
      
     

})
