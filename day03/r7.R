aggregate(math~class,exam,mean)

ex1 <- exam %>%
  group_by(class) %>%
  summarise(mean_math=mean(math),
            sum_english=sum(english),
            mean_science=mean(science),
            n=n()
            )




