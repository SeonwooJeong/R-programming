#install.packages("stringi")
#대한민국 지도를 다운로드
#install.packages("devtools")
#d
library(moonBook2)
library(kormaps2014)
library(dplyr)
library(stringi)



str(changeCode(korpop1))

ggChoropleth(data=kopop1, aes(fill=pop, map_id=code, tooltip=name),map=kormap1,interactive=T)

ggChoropleth()

library(ggplot2)
theme_set(theme_gray(base_family="NanumGothic"))

ggplot(korpop1,aes(map_id=code,fill=총인구_명))+
  geom_map(map=kormap1,colour="black",size=0.1)+
  expand_limits(x=kormap1$long,y=kormap1$lat)+
  scale_fill_gradientn(colours=c('white','orange','red'))+
  ggtitle("2015년도 시도별 인구분포도")+
  coord_map()


ggChoropleth(korpop2,kormap2,fillvar="남자_명")