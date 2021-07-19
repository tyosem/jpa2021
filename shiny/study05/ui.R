# ui.R

library(shiny)
library(ggplot2)
shinyUI(fluidPage(
  titlePanel("ファイルと変数を指定してヒストグラムを描く"),
  sidebarLayout(
    # サイドパネルの描画
    sidebarPanel(
      # ファイル名と拡張子を指定してデータを入力
      fileInput("file1", h6("拡張子が csv か datのファイルを選択"),
                accept = c(".csv",".dat"),
                buttonLabel = "参照",
                placeholder = "ファイルは未選択"
                ),
      # ファイルのコーティング選択、文字化け対応
      selectInput("Encoding", label = h3("ファイルのコーティング"), 
                  choices = list("shift-jis" = "shift-jis", 
                                 "UTF-8" = "UTF-8"
                                 ),selected = "shift-jis"),
      # ヘッダーがあるか否かの論理値の入力
      checkboxInput("header", "ヘッダーがあればチェック", TRUE),

      # セパレータを多肢選択で選ぶ
      radioButtons("sep", "区切り文字",
                   choices = c(カンマ = ",",
                               セミコロン = ";",
                               タブ = "\t"),
                   selected = ","),

      # データセットを示すときに全部示すか、ヘッドだけかの選択
      radioButtons("disp", "データセットの閲覧",
                   choices = c(最初 = "head",
                               全部 = "all"),
                   selected = "head"),

      # ヒストグラムを描く変数を選択する
      uiOutput("html.select")
    ),

    # メインパネルの描画
    mainPanel(
      # データフレームの描画
      tableOutput("contents"),
      # ヒストグラムの描画
      plotOutput("hist_plot")
    )

  )
))
