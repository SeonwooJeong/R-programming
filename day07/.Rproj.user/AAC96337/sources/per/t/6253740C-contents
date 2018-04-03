#=======================
# 텍스트마이닝(18.04.03)
#=======================
library(dplyr)
install.packages('rJava')
#윈도우-고급설정-환경변수에 JAVA_HOME을 추가한다.
library(rJava)                
install.packages('KoNLP')
library(KoNLP)                #
install.packages('memoise')
library(memoise)              #
install.packages('stringr')
library(stringr)              #특수문자제거
useNIADic()

txt <- readLines('hiphop.txt')
txt2<- readLines('koggiri.txt')
#웹에서 바로 가져올 수 있
txt3<- readLines('http://www.emodetour.com')
#특수문자 제거
txt <- str_replace_all(txt,'\\W',' ')

txt2 <- str_replace_all(txt2,'\\W',' ')
txt2 <- str_replace_all(txt2,'[0-9][0-9][0-9][0-9]년 [0-9][0-9]월 [0-9][0-9]일','')
txt2 <- str_replace_all(txt2,'오후','')
txt2 <- str_replace_all(txt2,'오전','')
txt2 <- str_replace_all(txt2,'사진','')
txt2 <- str_replace_all(txt2,'[0-9]','')
txt2 <- str_replace_all(txt2,'[0-9][0-9]','')
txt2 <- str_replace_all(txt2,'"','')
txt2 <- str_replace_all(txt2,'이준영선배님','')
txt2 <- str_replace_all(txt2,'고용훈선배님','')
txt2 <- str_replace_all(txt2,'문형석선배님','')
txt2 <- str_replace_all(txt2,'홍명기선배님','')
txt2 <- str_replace_all(txt2,'회원님','')
txt2 <- str_replace_all(txt2,'이현택','')
txt2 <- str_replace_all(txt2,'년','')
txt2 <- str_replace_all(txt2,'월','')
txt2 <- str_replace_all(txt2,'일','')
txt2 <- str_replace_all(txt2,'저장한 날짜','')
txt2 <- str_replace_all(txt2,'ㅋ','')


head(txt)
head(txt2)

#명사만 추출하기
nouns<-extractNoun(txt)
nouns2<-extractNoun(txt2)
#nouns는 리스트
class(nouns)
class(nouns2)
#리스트를 문자열 벡터로 변환 후 단어별 빈도표 생성
wordcount<-table(unlist(nouns))
wordcount2<-table(unlist(nouns2))
class(wordcount)
class(wordcount2)
#데이터프레임변환/ stringsAsFactors string들을 facotor로 넣을거야?
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
df_word2 <- as.data.frame(wordcount2, stringsAsFactors = F)
#변수명 수정
df_word <- rename(df_word, word=Var1, freq=Freq)
df_word2 <- rename(df_word2, word=Var1, freq=Freq)
#두글자 이상 단어 추출
df_word <- filter(df_word, nchar(word)>=2)
top_20<- df_word %>% arrange(desc(freq)) %>% head(20)

df_word2 <- filter(df_word2, nchar(word)>=2)
top_20<- df_word2 %>% arrange(desc(freq)) %>% head(20)

#워드 클라우드 만들기
install.packages('wordcloud')
library(wordcloud)
library(RColorBrewer)
#Dark2 색상 목록에서 10개 색생 추출
pal <- brewer.pal(9,'Blues')[5:9]
set.seed(1234)

jpeg(filename = "wordcloud.jpg",width = 680,height = 680,quality = 100);

p=wordcloud(words=df_word$word,   # 단어
          freq=df_word$freq,    # 빈도
          min.freq = 2,         # 최소단어 빈도
          max.words = 200,      # 표현 단어 수
          random.order = F,     # 고빈도 단어 중앙 배치
          rot.per = .1,         # 회전 단어 비율
          scale = c(4, 0.3),    # 단어 크기 범위
          colors = pal)         # 색상목록

print(p)
dev.off()
####################################################
pal <- brewer.pal(9,'Blues')[5:9]
set.seed(1234)

jpeg(filename = "wordcloud2.jpg",width = 680,height = 680,quality = 100);

p=wordcloud(words=df_word2$word,   # 단어
            freq=df_word2$freq,    # 빈도
            min.freq = 2,         # 최소단어 빈도
            max.words = 200,      # 표현 단어 수
            random.order = F,     # 고빈도 단어 중앙 배치
            rot.per = .1,         # 회전 단어 비율
            scale = c(4, 0.3),    # 단어 크기 범위
            colors = pal)         # 색상목록

print(p)
dev.off()
