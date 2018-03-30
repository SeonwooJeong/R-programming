library('ggplot2')
View(mpg)
dim(mpg)
summary(mpg)
tf <- data.frame(x=c(1:5),y=c(6:10))
colnames(tf) <- c('col1','col2')
library(dplyr)
tfc <-rename(tf,'XX1'=x, 'YY1'=y)

mpg <- rename(mpg, 'city'='cty', 'highway'='hwy')

mpg$total <- (mpg$cty+mpg$hwy)/2

hist(mpg$total)

mpg$test <- ifelse(mpg$total >=20, 'PASS','FAIL')
table(mpg$test)
as.vector(table(mpg$test))
qplot(mpg$test)

#total연비를 3등급으로 나누고자 한다.(30이상 A, 20~29 B, 20미만 C)
#grade라는 컬럼을 만들어 추가 한다.
#grade를 기준으로 그래프를 그린다.
mpg$grade <- ifelse(mpg$total >=30, "A", ifelse(mpg$total>=20,"B","C"))
head(mpg, 20)
table(mpg$grade)
qplot(mpg$grade)

#p123 문제풀이
