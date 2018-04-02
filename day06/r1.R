#209 ~ 261
#install.packages('foreign')
#install.packages('readxl')

library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

# 데이터 불러오기
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = T)

# 복사본 만들기
welfare <- raw_welfare

# 데이터 검토하기
str(welfare)

#콜럼 갯수
length(colnames(welfare))

welfare <-rename(welfare, sex= h10_g3, birth = h10_g4, marriage = h10_g10,religion=h10_g11, income=p1002_8aq1, code_job=h10_eco9, code_region=h10_reg7)

table(welfare$sex)

qplot(welfare$sex)