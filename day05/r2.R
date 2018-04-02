library(dplyr)
mpg2 <- mpg[,c('drv','hwy')]
result <-aggregate(hwy~drv,mpg,mean)
ggplot(data=result, aes(x=reorder(drv,hwy),y=hwy))+geom_col()
ggplot(data=result, aes(x=reorder(drv,-hwy),y=hwy))+geom_col()
ggplot(data=mpg,aes(x=drv))+geom_bar()
#빈도 막대그래
ggplot(data=mpg,aes(x=hwy))+geom_bar()
result2 <- aggregate(cty~manufacturer+class,mpg,mean)
result3<-result2[result2$class=='suv',]
result4 <- result3[order(result3$cty,decreasing = T),]
result <-head(result4,5)