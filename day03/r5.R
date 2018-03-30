library(dplyr)
exam <- read.csv('csv_exam.csv')
colnames(exam)<- c('id','class','math','english','science')

c1 <- exam[exam$class !=1,]
c2 <- exam[exam$math >=50 & exam$english >= 30,]
c3 <- sqldf('SELECT * FROM exam WHERE math >=50 AND english >=30')
#c1 <- exam %>% filter(class==1)

#p133
aggregate(hwy~displ <=4,mpg,mean)

result1 <- aggregate(cty~manufacturer,mpg,mean)

result2 <- result1[result1$manufacturer %in% c('audi','toyota'),]

result3 <- aggregate(hwy~manufacturer,mpg,mean)
#코드안됨
result4 <- result1[result1$manufacturer %in% c('chevrolet', 'ford','honda')]

temp <- aggregate(hwy~displ <= 4, mpg, mean)
qplot(temp$hwy, x=c('5<=','4>='))