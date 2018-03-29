# r7
name <- c('lee','kim','park','jang','hong');
age <- c(10,20,30,40,50);
weight <- c(40,50,60,70,80);
df <- data.frame(name,age,weight);
dim(df)
nrow(df)
ncol(df)

df[1,1]
df[2,2]
df[1,]
mean(df[,2])
df2 <-df[c(1:3),]
mean(df2[,2])
df2 <- df[,'age']
mean(df$age)
max(df$age)

c <-df$age
mx <- which(df$age ==max(df$age)) #가장큰값 위치
mn <- which(df$age ==min(df$age)) #가장 작은 값 위
mean(df$age[c(-mx,-mn)])

df$height <- c(180,170,160,150,155)
#weight / (height)*(height)*10000
#bmi
df$bmi <- df$weight / (df$height ^ 2) *10000
df2 <- df[df$weight >= 50 & df $weight <= 60,]
df2[which(df$height == max(df$height)),]

ww<- df2$weight
hh<- df2$height