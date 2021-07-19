#server.R

library(shiny)
shinyServer(function(input, output) {
  output$action_num <- renderText(input$action)
})
