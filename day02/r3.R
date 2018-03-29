c2 <- c(1,2,3,NA,5);
mean(c2,na.rm = T)

f1 <- function(a,b){
  return(a+b);
}

cc <- c('1','1','1','1')
mean(cc) #안됨
mean(as.numeric(cc))

ccc <-c(12,43,84,25,101,70,60)
#60~80까지 데이터만 끄집어내
ccc[ccc>=60 & ccc<= 80]
#2의 배수만 가져와라
ccc <-c(12,43,84,25,101,70,60)
ccc[ccc%%2==0]