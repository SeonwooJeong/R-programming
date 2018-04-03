#구글맵 라이브러리
library(RgoogleMaps)
#맵 센터 설정(구글 맵에서 획득)
mycenter=c(37.501246,127.039459)
#해당 센터를 가진 맵불러오기
mymap<-GetMap(
  center = mycenter,
  zoom = 11,
  maptype = 'load',
  format = 'roadmap',
  destfile = 'mymap.jpg'
)
#맵 좌표 지정 및 저
jpeg(filename = "mypoint.jpg", width = 680, height = 680, quality = 100)
mydata<-data.frame(
  a=c(1:5),
  lat=c(37.504273,37.506026,37.513341,37.533341,37.543341),
  lon=c(127.047781,127.046156,127.033690,127.053690,127.073690)
)
p<-PlotOnStaticMap(mymap,
                lat=mydata$lat,
                lon = mydata$lon ,
                cex=1, pch=10,col='red'                
                )
print(p);
dev.off()