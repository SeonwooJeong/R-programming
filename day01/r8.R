t1<-matrix(c(80,80,90,99,90,99,78,89,70,78,82,78,100,72,78,90), nrow=4)
colnames(t1) <- c('ko','en','si','ma')
rownames(t1) <- c('kim','lee','hong','jang')
t1

avg <- rowMeans(t1)
t2 <- cbind(t1, avg)
sum <- rowSums(t1)
t2 <- cbind(t2, sum)
avg <- c(colMeans(t2))
t3 <- rbind(t2, avg)
t3