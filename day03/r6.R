exam[exam$class==2, 'english']
exam[exam$class==2, c('english','math')]
temp<- c(3,1,3,5,4,2,3)
sort(temp, decreasing = T)


exam[order(exam$class,exam$math,decreasing=T),]
exam2 <- exam %>% arrange(class,desc(math))
exam3 <- exam %>% arrange(desc(math))
ex4 <- head(exam3,5)

#각 반 별 3과목 평균이 높은사람 순으로 정렬하시오
exam$avg <- rowMeans(exam[,c(3:5)])
exam4 <- exam %>% arrange(class,desc(avg))

#p141

#p144