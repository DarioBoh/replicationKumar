ui1 <- function(){
  tagList(
    div(id = "login",
        wellPanel(textInput("lsuId", "LSUid"),
                  textInput("age", "age"),
                  radioButtons('gender', label='Gender',
                               choices = list("Male" = 0, "Female" = 1), inline = T),
                  
                  br(),actionButton("confirm", "Confirm"))),
    tags$style(type="text/css", "#login {font-size:10px;   text-align: left;position:absolute;top: 40%;left: 50%;margin-top: -100px;margin-left: -150px;}")
  )}