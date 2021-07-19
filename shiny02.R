# Working directory‚ª 'toyoda/scrwin' ‚Å‚ ‚é‚±‚Æ‚ÌŠm”F
getwd()

shiny::runApp('./shiny/study04')
shiny::runApp('./shiny/study05')

shiny::runUrl("https://github.com/tyosem/Shiny_example/raw/main/study05.zip")

rsconnect::setAccountInfo(name='toyosem',
                          token='xxxxxxxxxx',
                          secret='xxxxxxx')

library(rsconnect)
rsconnect::deployApp('./shiny/study05')
