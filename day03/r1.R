library('googleVis')
head(Fruits)
class(Fruits)
banana<- Fruits[Fruits$Fruit == 'Bananas',]
result <- sum(banana$Sales)

# group by 와 같은 역할
# aggregate(데이터기준, 데이터, 함수)
df1 <- aggregate(Profit~Fruit+Year,Fruits,sum)
df2 <- Fruits[,c(4:6)] 
#콜럼 4,5,6을 짤라냄
apply(df2,2,sum) #colSums(df2)랑 비슷함

# 1.Fruits 데이터를 기반으로 년도별 월별 Sales 합을 구하시오
df3 <- aggregate(Sales~substr(Date,1,4)+substr(Date,6,7),Fruits,sum)
df4 <- aggregate(Profit~substr(Date,1,4)+substr(Date,6,7),Fruits,sum)

# 2. 1번의 결과를 기반으로 순이익(Psales)컬럼을 추가한다. 공식(Sales - Profit) *1.83
df3$Psales <- (df3$Sales-df4$Profit)*1.83

# 3. 년별 월 별 세금을 계산 한다. 세금은 (총 판매액(Sales)-총 수익(Profit))*0.1이다.
#년, 월, 세금(Fee)
df5 <- aggregate((Sales-Profit)*0.1~substr(Date,1,4)+substr(Date,6,7),Fruits,sum)
colnames(df5) <- c('Year','Month','Fee')
df5

# 2. apply
# 3. sapply

#1안
