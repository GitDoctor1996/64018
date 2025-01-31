#Reading the data

data_GDP <- read.csv("C:/Users/nicho/Google Drive/School/Graduate School
                 /Kent State/Fall 2019/Quantitative Management Modeling
                 /HW/HW1 Data.csv") 

View(data_GDP)

#Creating the Summary Statistics

summary(data_GDP)

#Creating the time series graph

data_GDP$DATE <- as.Date(data_GDP$DATE,'%m/%d/%Y') 

plot(x=data_GDP$DATE, y=data_GDP$GDP_Growth, type='b', col='#ff0000', xlab='Date', ylab='GDP Growth', main='US GDP Growth Trends')