library(KoNLP)
library(dplyr)
library(stringr)
library(wordcloud)
library(RColorBrewer)

useNIADic()
k1 <- readLines('k9_1.txt')
k2 <- readLines('k9_2.txt')
k3 <- readLines('k9_3.txt')
k4 <- readLines('k9_4.txt')
k5 <- readLines('k9_5.txt')
k6 <- readLines('k9_6.txt')
k7 <- readLines('k9_7.txt')
k8 <- readLines('k9_8.txt')
k9 <- readLines('k9_9.txt')

k<- c(k1, k2, k3,k4,k5,k6,k7,k8,k9)


k <- gsub('_', '',k)
k <- gsub('\\W', ' ',k)
k <- gsub(' ', ' ',k)
k <- gsub('  ', '',k)
k <- gsub('[0-9]', '',k)
k <- gsub('[A-Z]', '',k)
k <- gsub('[a-z]', '',k)
k <- gsub('만', '',k)
k <- gsub('대', '',k)
k <- gsub('c', '',k)
k <- gsub('등', '',k)
k <- gsub('원', '',k)
k <- gsub('한', '',k)
k <- gsub('기아차', '',k)


k<- extractNoun(k)

vc<- unlist(k)
wc<- table(vc)

wf <- as.data.frame(wc,stringsAsFactors =  F)


wf<-filter(wf,nchar(wf$vc)>=2 & nchar(wf$vc) <=5 )
str(wf2)


wc<- function(a){

  
  if(a==1){ #wordcloud
    wf <- head(wf[order(wf$Freq,decreasing = T),],30)
    pal<-brewer.pal(7,'Set1');
    set.seed(1234);
    
    jpeg(filename = "wc.jpg", width = 1000, height = 1000, quality = 100)
    
    
    p=wordcloud(words=wf$vc,freq = wf$Freq, min.freq = 1, max.words=200,
                random.order=F, color=pal,scale = c(12,1), rot.per = 0.1)
    print(p)
    dev.off()
  }else{
    library(ggplot2)
    pal<-brewer.pal(7,'Set1');
    set.seed(1234);
    
    jpeg(filename = "wcbar.jpg", width = 1000, height = 1000, quality = 100)
    
    order <- arrange(wf, Freq)$vc
    p =  ggplot(data = wf, aes(x = vc, y = Freq)) +
      ylim(0, 50) +
      geom_col() +
      coord_flip() +
      scale_x_discrete(limit = order) +
      geom_text(aes(label = Freq), hjust = -0.3)
    
    print(p);
    dev.off();
  }
}