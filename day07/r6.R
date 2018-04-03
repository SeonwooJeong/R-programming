# 1. data load : data frame
# wifi function
# 1== kt
# 2== LG
# 3== SKT
# save image file
library(RgoogleMaps)
library(readxl)
library(dplyr)
df<-read.csv("seoul.csv")
mycenter<-c(mean(df$lat),mean(df$lon))
mymap<-GetMap(
  center = mycenter,
  zoom = 11,
  maptype = 'load',
  format = 'roadmap',
  destfile = 'mymap2.jpg'
)
#KT분리
KT<-df %>% filter(type=="KT")
#LG분리
LG<-df %>% filter(type=="LGU+")
#SKT분리
SKT<-df %>% filter(type=="SKT")

df2<-data.frame()
name<-"d"
wifi<-function(a){
  if(a==1){
    b<-nrow(KT)
    df2<-KT
    name<-"KT.jpg"
  }else if(a==2){
    b<-nrow(LG)
    df2<-LG
    name<-"LG.jpg"
  }else{
    b<-nrow(SKT)
    df2<-SKT
    name<-"SKT.jpg"
  }
  jpeg(filename = name, width = 680, height = 680, quality = 100)
  mydata<-data.frame(
    a=c(1:b),
    lat=c(df2$lat),
    lon=c(df2$lon)
  )
  p<-PlotOnStaticMap(mymap,
                     lat=mydata$lat,
                     lon = mydata$lon ,
                     cex=1, pch=10,col='red'                
  )
  print(p);
  dev.off()
}
