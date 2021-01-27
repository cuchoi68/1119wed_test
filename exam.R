exam <- read.csv("csv_exam.csv")
exam %>% filter(class == 1 | class == 2 | class == 5 )
exam %>% filter(class %in% c(1,3,5))
exam %>% select(class,math)
exam %>% select(-science)

exam %>%
  filter(math >= 60) %>%
  select(id,math)

exam %>% arrange(class, desc(english))

exam1 <- exam %>% mutate(avg = (math+english+science)/3)
exam1
exam2 <- exam1 %>%  mutate(pass = ifelse(avg>=60,"pass", "fail"))
table(exam2$pass)
exam3 <- exam2 %>%  mutate (grade = ifelse(avg>=90,"a",ifelse(avg>=70,"b","c")))
table(exam3$grade)
exam3 %>%
  group_by(class) %>%
  summarise(mean_math=mean(math))

exam %>%
  group_by(class,pass) %>%
  summarise(n_pass=n())


mid <- read.csv("test1.csv")
final <- read.csv("test2.csv")
test <- read.csv("test3.csv")
test
teacher <- read.csv("teacher.csv")
teacher
total <- right_join(mid,final,by="id")
exam4 <- left_join(exam3,teacher,by="class")
total <- bind_rows(total,test)
total
total

