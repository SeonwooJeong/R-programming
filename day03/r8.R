mpg %>%
  group_by(manufacturer,drv) %>%
  summarise(mcty=mean(cty)) %>%
  arrange(desc(mcty)) %>%
  head(5)

mmpg1 <- aggregate(cty~class,mpg,mean)
mmpg1[order(mmpg1$cty,decreasing = T),]

mmpg2 <- aggregate(hwy~manufacturer,mpg,mean)
head(mmpg2[order(mmpg2$hwy,decreasing = T),],3)

mmpg3 <- mpg[mpg$class %in% c('compact'),]
sort(table(mmpg3$manufacturer),decreasing = T)