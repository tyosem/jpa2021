#server.R

library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
  df <- reactive({
    return(read.csv(input$file1$datapath,
                    header=input$header,
                    sep=input$sep,
                    fileEncoding = input$Encoding))
  })
  output$contents <- renderTable({
    req(input$file1)
    if(input$disp == "head") { return(head(df()))
    }else {                    return(df())     }
  })
  output$html.select <- renderUI({
    if(is.character(input$file1$datapath)) {
    # データセットが指定される後の変数選択ボッスク
      return(varSelectInput("variable", "変数を選んでください:", 
                            data=df()))
    }else {
    # データセットが指定される前の表示
      return(varSelectInput("variable", "変数を選んでください:", 
                            data=""))
    }
  })
  output$hist_plot <- renderPlot({
    if(is.character(input$file1$datapath)) {
    # 変数が指定された後のヒストグラム
      ggplot(df(), aes(!!input$variable)) + geom_histogram()
    }  
  })
})

