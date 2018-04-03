g1<- function(a){
  library(ggplot2);
  #dev.new()  
  
  if(a==1){
    jpeg(filename = "c:\\Rproject\\mychart1.jpg",width = 680, height = 680, quality = 100);
    p=ggplot(data=midwest,aes(x=poptotal, y=popasian))+geom_point()+xlim(0,500000)+ylim(0,10000);
  }else{
    jpeg(filename = "c:\\Rproject\\mychart2.jpg",width = 680, height = 680, quality = 100);
    p=ggplot(data=midwest,aes(x=popasian, y=poptotal))+geom_point()+xlim(0,500000)+ylim(0,10000);
  }
  print(p);  
  
  dev.off()
  
}

