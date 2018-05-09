# Database와 hadoop 데이터를 가지고 와서 R로 분석한다.
# R에서 함수화 시켜 스크립트 작성한다.
r<- function(){
library(rJava)
library(RJDBC)
library(DBI)
library(ggplot2)
library(dplyr)

drvName<- 'org.apache.hive.jdbc.HiveDriver';
id<- 'root';
pwd<- '111111'
url<-'jdbc:hive2://192.168.111.100:10000'

hive_lib<-'c://java_hive_lib'
.jinit();
.jaddClassPath(dir(hive_lib,full.names = T));
.jclassPath();

# 1. Driver Loading
drv <- JDBC(driverClass = drvName,classPath = 'hive-jdbc-1.0.1.jar')
# 2. Connection
conn<- dbConnect(drv,url,id,pwd)
# 3. Statement
seoul<-"SELECT year,sum(casualties) FROM car_accident where do='Seoul'GROUP BY year";
ky<-"SELECT year,sum(casualties) FROM car_accident where do='Gyeonggi'GROUP BY year";
ic<-"SELECT year,sum(casualties) FROM car_accident where do='incheon'GROUP BY year";
# 4. ResultSet
s1<-dbGetQuery(conn,seoul);
colnames(s1)<-c('YEAR','TOTAL')
s2<-dbGetQuery(conn,ky);
colnames(s2)<-c('YEAR','TOTAL')
s3<-dbGetQuery(conn,ic);
colnames(s3)<-c('YEAR','TOTAL')
# 5. Close
dbDisconnect(conn)
#Hive 데이터 끌어옴
###################################################################
drvName<- 'oracle.jdbc.driver.OracleDriver';
id<- 'ruser';
pwd<- '111111'
url<-'jdbc:oracle:thin:@localhost:1521:XE'

# 1. Driver Loading
drv <- JDBC(driverClass = drvName,classPath = 'c:\\java_hive_lib\\ojdbc6.jar')
# 2. Connection
conn<- dbConnect(drv,url,id,pwd)
# 3. Statement
sqlstr2<-"select year, total from car where location='서울특별시' AND year>= 2012 AND year<=2016";
sqlstr3<-"select year, total from car where location='경기도'AND year>= 2012 AND year<=2016";
sqlstr4<-"select year, total from car where location='인천광역시'AND year>= 2012 AND year<=2016";
# 4. ResultSet
car<-dbGetQuery(conn,sqlstr2);
car2<-dbGetQuery(conn,sqlstr3);
car3<-dbGetQuery(conn,sqlstr4);
class(car)
# 5. Close
dbDisconnect(conn)
#Oracle 데이터 불러옴 
####################################################################
#데이터 조합 s$total과 car$total을 사용해서 의미부여
# s$total/car$total*100000 이 높을 수록 차량등록대비 사고율이 높음
r1<-data.frame('서울시'=s1$TOTAL/car$TOTAL*100000) #서울
r2<-data.frame('경기도'=s2$TOTAL/car2$TOTAL*100000)#경기도
r3<-data.frame('인천시'=s3$TOTAL/car3$TOTAL*100000)#인천
r4<-data.frame(YEAR=s3$YEAR)

  v3<-data.frame(r4,r1,r2,r3);
  return(v3);
}

#loc=c('서울','경기','인천')
#options(scipen=100)
#ggplot(data = r1, aes(x=YEAR,y=result))+geom_line()+geom_point()+geom_line(data=r2,aes(x=YEAR,y#=result),colour="blue")+geom_line(data=r3,aes(x = YEAR, y = result),colour="red")+theme_bw()




