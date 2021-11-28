library(astsa)
library(ggplot2)
library(readxl)
library(tidyverse)
library(xts)

##Loading in datasets, NOTE: 2021 is an incomplete dataset that we can use as a Test set
load17.df <- read_excel('/Users/data/Native_Load_2017.xlsx')
load18.df <- read_excel('/Users/data/Native_Load_2018.xlsx')
load19.df <- read_excel('/Users/data/Native_Load_2019.xlsx')
load20.df <- read_excel('/Users/data/Native_Load_2020.xlsx')
load21.df <- read_excel('/Users/data/Native_Load_2021.xlsx')


## The load dataset for 2017 had a space in the Timestamp column, preventing the binding of the four years
colnames(load17.df)[1] <- "HourEnding"

## Using bind_rows from tidyverse, I merged 2017-2020
load_4_year <- bind_rows(load17.df,load18.df,load19.df,load20.df)
sum(is.na(load_4_year))

## Using strptime, I converted the time column to a date variable
load_4_year$HourEnding <- strptime(load_4_year$HourEnding, format="%m/%d/%Y %H:%M")
load_4_year$HourEnding <- as.Date(load_4_year$HourEnding, format="%m/%d/%Y %H:%M")

class(load_4_year$HourEnding)
head(load_4_year)
sum(is.na(load_4_year))

## Converting to a time series

ts_load <- xts(load_4_year, load_4_year$HourEnding)



