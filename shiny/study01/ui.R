#ui.R

library(shiny)
shinyUI(fluidPage(
  # タイトル
  titlePanel("階級値の数を変更できるヒストグラム"),
  # レイアウトの設定
  sidebarLayout(
    sidebarPanel( "サイドバーパネルの指定"),
    mainPanel("メインパネルの指定")
  )
))
