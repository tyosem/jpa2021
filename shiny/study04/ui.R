# ui.R

library(shiny)
shinyUI(fluidPage(
  titlePanel("基本的なウィジェット"),
  fluidRow(
    column(3, # 3は列のサイズ、1-12と設定できる
      h3("アクションボタン"),
      actionButton("action", label = "ここを押す"),
      br(),
      mainPanel(p("アクションボタン今の値は",
                  textOutput("action_num",inline=T))),
      br(),
      h3("実行ボタン"),
      submitButton("Submit", text ="実行")
      ),

    column(3,
      h3("論理値の指定"),
      checkboxInput("checkbox", label = "決意する!!", value = F)),

    column(3, 
      checkboxGroupInput("checkGroup", 
        label = h3("無制限複数選択"), 
        choices = list("1.戸締り" = 1, 
           "2.消灯" = 2, "3.火の始末" = 3),
        selected = 1)),

    column(3, 
      dateInput("date", 
        label = h3("日付の入力"), 
        language = "ja",
        value = paste(substr(Sys.Date(),1,4),"-01-01",sep="")))   
  ),

  fluidRow(

    column(3,
      dateRangeInput("dates", label = h3("日付の範囲入力"))),

    column(3,
      fileInput("file", label = h3("入力ファイルの指定"),
      accept = ".csv",  # csvの入力を促す。
      buttonLabel = "参照",
      placeholder = "ファイルが選択されていません"
    )),

    column(3, 
      h3("ヘルプ文章"),
      helpText("注：ヘルプテキストは、正確にはウィジェットではない。",
               "ただし他のウィジェットに付随するテキストを追加する",
               "簡単な方法を提供する。")),

    column(3, 
      numericInput("num", 
        label = h3("数値を入力してください"), 
        value = 1,  width="50%"))   
  ),

  fluidRow(

    column(3,
      radioButtons("radio", label = h3("ラジオボタン"),
        choices = list("1. 回帰分析" = 1, "2. 因子分析" = 2,
                       "3. 実験計画" = 3),selected = 1)),

    column(3,
      selectInput("select", label = h3("選択ボックス"), 
        choices = list("1. 回帰分析" = 1, "2. 因子分析" = 2,
                       "3. 実験計画" = 3),selected = 1)),

    column(3, 
      sliderInput("slider1", label = h3("値が1つのスライダー"),
        min = 0, max = 100, value = 50),
      sliderInput("slider2", label = h3("値が2つのスライダー"),
        min = 0, max = 100, value = c(25, 75))
      ),

    column(3, 
      textInput("text", label = h3("テキスト入力"), 
        value = "ここに文章を入力して下さい。"))   
  )

))
