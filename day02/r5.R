name <- c('김지훈','이유진','박동현','김민지')
gender <- c('m','f','m','f')
ko <- c(90,80,60,70)
ma <- c(50,60,100,20)
si <- c(87,54,79,89)
en <- c(54,67,87,88)
add <- c('서울시','광주시','대전시','부산시')
df <- data.frame(name,gender,ko,ma,si,en,add)
#학생별 과목별 평균을 구하고
#각각 vector에 넣으시오
df2 <- df[,c(3:6)]
submean <-colMeans(df2)
stumean <- rowMeans(df2)
names(stumean) <- df[,1]

temp <- df[,'add']
class(temp)
temp2 <- as.character(temp)
class(temp2)
df$add<-substr(temp2,1,2)
df$add2 <- substr(temp2,3,3)

#여학생과 남학생 구분
dfm <- df[gender== 'm',]
dff <- df[gender=='f',]
mavg <- colMeans(dfm[,c(3:6)])
favg <-colMeans(dfm[,c(3:6)])

#학생 별 국어와 영의 평균을 구하시오
#vector로 표현 하시오
#단 컬럼 명은 학생의 이름으로 표시하시
result <- rowMeans(df[,c(3,6)])
names(result) <- df$name
result

# 여학생들의 과목 별 평균을 구하시오. vector로 표현하시오
# 단 컬럼 명은 과목명이 표시 된다.
result <- df[df$gender=='f',]
r1 <-colnames(df[,c(3:6)])

result2 <- df[df$gender=='m',]
r2 <- colMeans(result2[,c(3:6)])

result3 <- rbind(r1,r2)
class(result3)
result4 <- as.data.frame(result3)
class(result4)