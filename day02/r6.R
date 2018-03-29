#excel을 가져와서 data.frame로 만들어서 리턴
exdata <- function(){
  library(readxl)  
#  data<-read_excel('excel_exam_nohead.xlsx', col_names = F);
#컬럼명이 없을때
  #다른 시트에 자료가 있을때
  data <- read_excel('excel_exam_3.xlsx',sheet = 2);
  return(data);
}

data<-exdata()
#컬럼명이 없을때 지정해줌
#colnames(data) <- c('a','b','c','d','e')

