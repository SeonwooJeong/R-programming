#####################################################
###지역별 연도별 차량 등록대수
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
sqlstr2<-"select year, total from car where location='서울특별시'";
sqlstr3<-"select year, total from car where location='경기도'";
sqlstr4<-"select year, total from car where location='인천광역시'";
# 4. ResultSet
car<-dbGetQuery(conn,sqlstr2);
car2<-dbGetQuery(conn,sqlstr3);
car3<-dbGetQuery(conn,sqlstr4);
class(car)
# 5. Close
dbDisconnect(conn)
#1. 데이터 수집 CSV

#2. Developer를 이용하여 테이블을 생성하여 입력 한다.

#3. R을 이용하여 데이터를 분석
location=c('서울특별시','경기도','인천광역시')
options(scipen=10000000)
ggplot(data = car, aes(x=YEAR,y=TOTAL,fill='location'))+geom_line()+geom_point()+geom_line(data=car2,aes(x=YEAR,y=TOTAL),colour="blue")+geom_point(data=car3,aes(x = YEAR, y = TOTAL),colour="red")




####################################################