#P289 인터렉티브 그래프 만들기
#패키지 설치
#install.packages("plotly")
#install.packages("htmlwidgets")
library(plotly)
library(ggplot2)
library(htmlwidgets)

p<-ggplot(data=mpg,aes(
  x=displ, y=hwy, col=drv
))+geom_point()

pp<-ggplotly(p)

saveWidget(pp,file = "aa.html")