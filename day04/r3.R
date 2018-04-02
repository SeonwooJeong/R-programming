st <- read.csv('csv_exam.csv',header = F)
colnames(st)<- c('id','class','ko','en','ma')
table(is.na(st$class))
mean(st$ko,na.rm = T)
#비어있는 공간을 NA라고 표현 

#학생 정보를 조회 하시오
# 단 id,class,ko 결측치가 있는 학생은 빼시오.
st[!is.na(st$ko) & !is.na(st$class) & !is.na(st$ko),c('id','class','ko')]
na.omit(st[,c('id','class','ko')])

# 국어, 영어, 수학 성적의 평균을 구하여
# vector를 만든다.
avg <- colMeans(st[,c('ko','en','ma')],na.rm = T)

# NA 값을 모두 0으로 바꾸시오
st$ko <- ifelse(is.na(st$ko),1,st$ko)
st$en <- ifelse(is.na(st$en),1,st$en)
st$ma <- ifelse(is.na(st$ma),1,st$ma)

# NA 값을 모두 0으로 바꾸시오.(클래스나 이름도 0으로 바뀔 수 있음)
st[is.na(st)]=0

boxplot(st$ko)
hist(st$ko)
