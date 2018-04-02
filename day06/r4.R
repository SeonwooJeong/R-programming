welfare <- welfare %>%
  mutate(ageg =ifelse(age<30,"young",ifelse(age<=59,"middle","old")))

table(welfare$ageg)

ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income=mean(income))

ageg_income

ggplot(data=ageg_income, aes(x=ageg, y=mean_income))+geom_col()

ggplot(data=ageg_income, aes(x=ageg, y=mean_income))+geom_col()+scale_x_discrete(limits=c("young","middle","old"))