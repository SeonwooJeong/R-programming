c1 <- c(1:5)
c2 <- c(6:10)
cs <- union(c1,c2)
cs2 <- setequal(c1,c2)

5*cs
5 %in% cs
result <- c(1:3) %in% cs
print (length(result))

c3 <- seq(1,1000,5)

m1 <-matrix(c(1,2,3,4,5,6,7,8,9), nrow=3)
colnames(m1) <- c('c1','c2','c3')
rownames(m1) <- c('r1','r2','r3')
m1[c(1:3)]
m1[c(1,2),3]
m1[c(1,2),c(2,3)]
m1['r2',]
m1[c('r2','r3'),'c3']
m1['r2']

m1*5
m1*m1
t(m1)
nrow(m1)
ncol(m1)
cc1 <- m1[,1]