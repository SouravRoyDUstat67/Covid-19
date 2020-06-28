library(haven)
regular_case_covid_19_1 <- read_sav("regular_case(covid-19)1.sav")
View(regular_case_covid_19_1)
 
data=regular_case_covid_19_1
data

#line graph
library(ggplot2)
ggplot(data, aes(x=date, y= daily_infected))+
  geom_line(size=1, col="blue")+
  geom_line(aes(y= daily_deaths), size=1, col="red")+
  theme(axis.text.x = element_text(angle = 90))+
  ylim(c(0,120))+
  ylab("frequency of cases")+
  ggtitle(label = "Daily New Infected(blue line) & Deaths(red line) due to Covid-19 in BD in 2020")


ggplot(data, aes(x=date, y= daily_infected))+
  geom_smooth(size=1, col="blue", se= F)+
  geom_smooth(aes(y= daily_deaths), size=1, col="red", se= F)+
  theme(axis.text.x = element_text(angle = 90))+
  ylim(c(0,120))+
  ylab("frequency of cases")+
  ggtitle(label = "A multiple smooth curve")


#cumulative line graph
library(dplyr)

data1=mutate(data, cum_infected=cumsum(daily_infected), cum_deaths=cumsum(daily_deaths))
data1
names(data1)

ggplot(data1, aes(x=date))+
  geom_line(aes(y= cum_infected), size=1, col="blue")+
  geom_line(aes(y= cum_deaths), size=1, col="red")+
  theme(axis.text.x = element_text(angle = 90))+
  ylim(c(0,500))+
  ylab("cumulative frequency of cases")+
  ggtitle(label = "Cumulative Frequency Polygon of Infected(blue line) & Deaths(red line) by Covid-19 in BD in 2020")


ggplot(data1, aes(x=date, y= cum_infected))+
  geom_smooth(size=1, col="blue", se= F)+
  geom_smooth(aes(y= cum_deaths), size=1, col="red", se= F)+
  theme(axis.text.x = element_text(angle = 90))+
  ylim(c(0,500))+
  ylab("cumulative frequency of cases")+
  ggtitle(label = "A cumulative frequency curve of infected & deaths by Covid-19 in BD in 2020")


#bar diagram for infected case
ggplot(data, aes(x= date, y= daily_infected))+
  geom_bar(stat = "identity", fill="#2196f3", col="black")+
  theme(axis.text.x=element_text(angle = 90))+
  ylab("number of daily new infected cases")+
  labs(title= "Bar Diagram for Daily New Infected by Covid-19 Cases in BD in 2020")+
  ylim(c(0,200))

#bar diagram for deaths case
ggplot(data, aes(x= date, y= daily_deaths))+
  geom_bar(stat = "identity", fill="red", col="black")+
  theme(axis.text.x=element_text(angle = 90))+
  ylab("number of daily new deaths")+
  labs(title= "Bar Diagram for Daily New deaths deu to Covid-19 in BD in 2020")+
  ylim(c(0,10))


