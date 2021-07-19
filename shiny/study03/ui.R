#ui.R

library(shiny)
shinyUI(fluidPage(

tags$head(tags$style(type="text/css",
      "
      .font-red { color: red }
      .back-grey { background-color: lightgrey }
      "
)),

  titlePanel("便利なタグ関数"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      p("p は、テキストの段落を作成します。この関数の後は改行されます。"),
      p("新しい段落を開始する場合は、新しい p() コマンドを使用します。"),
      h1("h1:統計学入門", align = "center"),
      h2("h2:回帰分析"),
      h3("h3:偏回帰係数"),
      h4("h4:応用例"),
      h5("h5:注意点", align = "right", style = "color:green"),
      h6("h6:予測変数が多い場合には、偏回帰係数を直接解釈してはいけない"),
      p("コードは code()で以下のように表示します。"),
      code("library(shiny)shinyServer(function(input, output) {})"),
      pre("pre()で囲まれた部分は、そのまま表示されます。
           #server.R
           
           library(shiny)
           shinyServer(function(input, output) {
           })"
      ),
      p("画像を使用したい場合、アプリにしているフォルダの中に「www」という名前のフォルダを用意して、
         その中に画像を格納します。"),
      p(code( "img(src = \"google.png\")"),"で画像を呼び出します。"),
      img(src = "google.png", height = 70, width = 210),
      p("スタイル属性を指定すると、フォントやサイズなど段落全体の書式を
        変更できます。",
        style = "font-family: 'times'; font-size: 16pt"),
      strong("Strong() はボールド体を表示します。"),
      em("そして em() はイタリック体を表示し、em は emphasized です。"),
      br(),
      h3("divとspan"),
      p("divやspanは一定の範囲をくくってグループ化します。",
        br(),
        "たとえば、以下の3つのpタグの文字は、引数 'style = color:blue' を 
           div に渡したため、すべて青で表示されます。"),
      div(p("divの1段落目"),
          p("divの2段落目"),
          p("divの3段落目"), 
          style = "color:blue"),
      h4("divで囲んだ場合、1つ1つがブロック要素なので改行されます"),
          div("あいうえお"),div("かきくけこ"),div("さしすせそ"),
      h4("spanで囲んだ場合、1つ1つはインライン要素なので改行されません"),
          span("あいうえお"),span("かきくけこ"),span("さしすせそ"),
      p("divと違って改行がされないので、spanは",
        span("文章の一部のスタイルを変更する際に",style="color:orange"),
        "使います。"),
      
      p("class属性は、或る属性を付与した対象すべてに対して、共通の装飾ルールを適用することができます。"),
      p("たとえば、",
        span("赤い文字",class="font-red"),
        "を",
        span("いくつものdivやspan",class="font-red"),
        "に",
        span("適用できます",class="back-grey"),
        "。"),
      p("複数の",
        span("classを与えることも可能です",class="font-red back-grey"),
        "。")
    )
  )
))
