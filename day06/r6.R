class(welfare$code_job)

table(welfare$code_job)

library(readxl)
list_job <-read_excel("Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)

welfare <- left_join(welfare, list_job, id="code_job")

welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)

job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

head(job_income)

#상위 10위 추출
top10 <- job_income %>%
  arrange(desc(mean_income)) %>%
  head(10)

ggplot(data=top10, aes(x=reorder(job,mean_income), y=mean_income))+geom_col()+coord_flip()

#하위 10위 호출
bottom10 <-job_income %>%
  arrange(mean_income) %>%
  head(10)

ggplot(data= bottom10, aes(x= reorder(job, -mean_income),y=mean_income))+geom_col()+coord_flip()+ylim(0,850)


