class(welfare$sex)

table(welfare$sex)

#1 남 2 여 9 무응답

welfare$sex <-ifelse(welfare$sex ==9, NA, welfare$sex)

table(is.na(welfare$sex))

welfare$sex <-ifelse(welfare$sex ==1, "male","female")
table(welfare$sex)

qplot(welfare$sex)

class(welfare$income)
summary(welfare$income)
qplot(welfare$income) +xlim(0,1000)

welfare$income <- ifelse(welfare$income %in% c(0,9999),NA,welfare$income)

table(is.na(welfare$income))

sex_income<-welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income=mean(income))

sex_income

ggplot(data=sex_income, aes(x=sex,y=mean_income))+geom_col()
