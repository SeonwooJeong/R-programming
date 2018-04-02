#변수형 확인
class(welfare$birth)
# numeric
summary(welfare$birth)
#이상치 확
qplot(welfare$birth)
#결측치 확인
table(is.na(welfare$birth))

welfare$birth <- ifelse(welfare$birth==9999, NA, welfare$birth)
table(is.na(welfare$birth))

# 파생변수 만들기 -나이
welfare$age <- 2015 - welfare$birth +1
summary(welfare$age)
qplot(welfare$age)

age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

head(age_income)

ggplot(data=age_income, aes(x=age, y=mean_income))+geom_line()