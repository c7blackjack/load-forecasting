library(astsa)
library(ggplot2)
library(readxl)
library(tidyverse)

load17.df <- read_excel('/Users/data/Native_Load_2017.xlsx')
load18.df <- read_excel('/Users/data/Native_Load_2018.xlsx')
load19.df <- read_excel('/Users/data/Native_Load_2019.xlsx')
load20.df <- read_excel('/Users/data/Native_Load_2020.xlsx')
load21.df <- read_excel('/Users/data/Native_Load_2021.xlsx')

colnames(load17.df)[1] <- "HourEnding"

load_4_year.df <- bind_rows(load17.df,load18.df,load19.df,load20.df)

load_4_year.df$HourEnding <- strptime(load_4_year.df$HourEnding, format = "%m-%d-%Y %H:%M")
class(load_4_year.df$HourEnding)
