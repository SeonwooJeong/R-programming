#install.packages('RJDBC')
#install.packages("DBI")

library(rJava)
library(RJDBC)
library(DBI)
library(ggplot2)

drvName<- 'oracle.jdbc.driver.OracleDriver';
id<- 'ruser';
pwd<- '111111'
url<-'jdbc:oracle:thin:@localhost:1521:XE'

# 1. Driver Loading
drv <- JDBC(driverClass = drvName,classPath = 'c:\\java_hive_lib\\ojdbc6.jar')
# 2. Connection
conn<- dbConnect(drv,url,id,pwd)
# 3. Statement
sqlstr<-'select trunc(months_between(sysdate,HIREDATE)) AS MON,SAL from emp';
# 4. ResultSet
emp<-dbGetQuery(conn,sqlstr);
# 5. Close
dbDisconnect(conn)

#1. emp회사의 근속 연수(오늘날짜기준 일)와 월급의 상관 관계를 그래프로 표현 하시오.

ggplot(data=emp,aes(x=emp$MON, y=emp$SAL))+geom_line()

#####################################
#2개의 데이터 1개의 그래프에 표
pressure<-pressure
pressure2<-pressure*2

ggplot(pressure,aes(x=temperature, y=pressure))+geom_line()+geom_point()+geom_line(data=pressure2,aes(x=temperature, y=pressure/2),colour="red")+geom_point(data=pressure2,aes(x = temperature, y = pressure/2),colour="red")

