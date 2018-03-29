getcsv <-function(){
  #data<- read.csv('csv_exam');
  #data<- read.csv('csv_exam2.csv',header = F);
  data<-read.csv('csv_exam3.csv',header = F,stringsAsFactors = F,encoding = 'UTF-8');
  class(data$V2)
  return(data);
}
writedata <- function(df){
  write.csv(df,file='result0328.csv')
}
#원본 데이터의 값을 수정해서 따로 저장 후 다시 불러와서 사용
data<-getcsv()
data$avg <-round(rowMeans(data[,c(4:6)]),2)
writedata(data)
newdata <- read.csv('result0328.csv',header = F,stringsAsFactors = F,encoding = 'UTF-8')