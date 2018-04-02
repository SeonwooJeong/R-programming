#p160
library(ggplot2)
midwest$popjuni <- 100-(midwest$popadults/midwest$poptotal*100)
head(midwest$popjuni)
midwest$grade <- ifelse(midwest$popjuni>=40, 'large',ifelse(midwest$popjuni<30, 'small','middle'))
head(midwest$grade)

midwest$popasianrate <- (midwest$popasian/midwest$poptotal*100)
head(midwest[order(popasianrate),c('state','country','popasianrate')],10)