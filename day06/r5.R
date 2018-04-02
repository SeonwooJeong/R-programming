sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income=mean(income))

sex_income

ggplot(data=sex_income, aes(x=ageg, y = mean_income, fill=sex))+geom_col()+scale_x_discrete(limits=c("young","middle","old"))

sex_age <-welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, sex)%>%
  summarise(mean_income =mean(income))

head(sex_age)

ggplot(data=sex_age, aes(x=age, y=mean_income, col=sex))+geom_line()