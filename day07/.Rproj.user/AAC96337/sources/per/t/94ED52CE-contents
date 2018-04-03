library(KoNLP)
library(dplyr)
library(stringr)
library(wordcloud)
library(RColorBrewer)

useNIADic()

txt1 <- readLines('txt1.txt')
txt2 <- readLines('txt2.txt')
txt3 <- readLines('txt3.txt')
txt<- c(txt1, txt2, txt3)

txt <- gsub('[0-9]','',txt)
txt <- gsub('[a-z]','',txt)
txt <- gsub('[A-Z]','',txt)
txt <- gsub('_', '',txt)
txt <- gsub('\\W', ' ',txt)
txt <- gsub(' ', ' ',txt)
txt <- gsub('  ', '',txt)
txt <- gsub('들이',' ',txt)

txt<- extractNoun(txt) # 

vc<- unlist(txt)
wc<- table(vc)

wf <- as.data.frame(wc,stringsAsFactors =  F)


wf<-filter(wf,nchar(wf$vc)>=2 & nchar(wf$vc) <=5 )
str(wf)
wf <- head(wf[order(wf$Freq,decreasing = T),],20)

pal<-brewer.pal(7,'Set1');
set.seed(1234);

jpeg(filename = "wordcloud3.jpg", width = 680, height = 680, quality = 100)


p=wordcloud(words=wf$vc,freq = wf$Freq, min.freq = 1, max.words=200,
              random.order=F, color=pal,scale = c(12,1), rot.per = 0.1)
print(p)
dev.off()