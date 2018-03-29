m3 <- matrix(c(80,90,70,100,80,99,78,72,90,78,82,78,99,89,78,90), nrow=4, byrow=TRUE)

d <- dim(m1)

colnames(m3) <- c('ko','en','si','ma')
rownames(m3) <- c('kim','lee','hong','jang')

rm<- rowMeans(m3);
cm<- colMeans(m3)