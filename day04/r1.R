tf <- data.frame(
  id=c(1:5),
  test=c(86:90)
)

tf2 <- data.frame(
  id=c(6:10),
  test=c(91:95)
)

total <- rbind(tf,tf2)

total$test2 <- c(90:99) #컬럼 추가

#avg colume에 평균을 입력 하시오
total$avg <-(total$test+total$test2)/2

#평균이 높은 순으로 top3를 조회 하시오
head(total[order(total$avg,decreasing = T),],3)


#평균이 평균 이상인 학생을 조회 하시오
total[total$avg >= mean(total$avg),]