library(sqldf)
str(iris)
head(iris)
class(iris)
mydata<-sqldf('SELECT * FROM iris
WHERE Species="setosa"')
colnames(iris)<-c('sl','sw','pl','pw','s')
mydata<-sqldf('SELECT s,
AVG(sl),
AVG(sw),
AVG(pl),
AVG(pw)
FROM iris GROUP BY s')
library(dplyr)
mydata2<- iris
#dplyr을 추가해야 사용가능
mydata2<- iris %>% filter(iris$Species=="setosa") 
# mydata2<- iris[iris$Species == 'setosa',]

mydata3 <-aggregate(sw~s,iris,mean)

mydata3 <-sapply(iris[,c(1:4)], mean)

ggplot(data=iris,aes(x=sl,y=pl))+geom_line()