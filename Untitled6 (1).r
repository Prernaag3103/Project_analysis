install.packages("tidyverse")

install.packages("here")
install.packages("skimr")
install.packages("janitor")
install.packages("dplyr")
library("tidyverse")
library("here")
library("skimr")
library("janitor")
library("dplyr")

install.packages("hms")

setwd("C:/Users/prern/Downloads")
daily_activity<-read.csv("dailyactivities_merged.csv")
daily_calories<-read.csv("dailycalories_merged.csv")
daily_intensities<-read.csv("dailyintensities_merged.csv")
daily_steps<-read.csv("dailysteps_merged.csv")
sleep_day<-read.csv("sleepday_merged.csv")
weight_log<-read.csv("weightloginfo_merged.csv")

head(daily_activity)

colnames(daily_activity)

head(daily_calories)

colnames(daily_calories)

head(daily_intensities)

colnames(daily_intensities)

head(daily_steps)

colnames(daily_steps)

head(sleep_day)

colnames(sleep_day)

head(weight_log)

colnames(weight_log)

n_distinct(daily_activity) #this function is used to determine the number of unique values

n_distinct(sleep_day)

n_distinct(weight_log)

nrow(daily_activity) #this function is used to number of rows in a data frame

nrow(sleep_day)

nrow(weight_log)

daily_activity %>%
select(TotalSteps,TotalDistance, SedentaryMinutes, LightlyActiveMinutes, FairlyActiveMinutes, VeryActiveMinutes, Calories)%>%
summary() # summary() function is used to pull key statistics about the data frames.

sleep_day %>%
select(TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed)%>%
summary()

weight_log%>%
select(WeightPounds, BMI)%>%
summary()

install.packages("ggplot2")

library(ggplot2)

df<- as.data.frame(daily_activity)

df%>%
ggplot(aes(x=VeryActiveMinutes, y=Calories)) + geom_point() + stat_smooth(method= lm)+ labs(title="Relationship between VeryActiveMinutes and Calories burned")
## 'geom_smooth' using formula y~x

df%>%
ggplot(aes(x=TotalDistance, y=Calories)) + geom_smooth()+ labs(title= "Relationship between Total Distance and Calories burned")

df%>%
ggplot(aes(x= TotalSteps, y= Calories)) + geom_point()+ stat_smooth(method=lm) + labs(title= "Relationship between Total 
steps and Calories burned")


ggplot(data=sleep_day, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point() + stat_smooth(method=lm)+ labs(title= 
"Relationship between Total minutes in bed and Total time in bed")


