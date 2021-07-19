#ui.R

library(shiny)
shinyUI(fluidPage(
  
  # タイトル
  titlePanel("階級値の数を変更できるヒストグラム"),
  
  # レイアウトの設定
  sidebarLayout(
    # サイドバーパネルの指定
    sidebarPanel(
      # スライダーの設定
      sliderInput("bins",
                  "階級値の数:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    # メインパネルの指定
    mainPanel(
      plotOutput("distPlot")   # ヒストグラムの表示
    )
  )
))