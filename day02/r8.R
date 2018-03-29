
getcsv <- function(){
  data <- read.csv('범죄자범행동기_2016년.csv')
  return(data)
}
data <- getcsv()

# 범죄대분류 = 강력범죄
cma <- data[data$범죄대분류=='강력범죄', ]
cma
library(ggplot2)
xcol<-c(cma[2])
ycol<-c(cma[3])
test<-data.frame(xcol,ycol)
ggplot(test, aes(범죄중분류, 계))+geom_bar(stat="identity")

#폭행의 범죄 동기 그래프 표현
q3 <- cma[cma$범죄중분류 == '강도',-c(1:3)]
x<-c(names(q3))
y<-c(as.integer(q3))
df<-data.frame(x,y)
names(df) <- c('강도_범행동기','계')
ggplot(df, aes(강도_범행동기, 계))+geom_bar(stat="identity")+coord_flip()

