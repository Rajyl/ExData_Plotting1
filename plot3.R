## Rajyl P. Muleta
## Module 4: Exploratory Data Analysis
## Project 1: plot3.R
## Output: plot3.png


## A. Check your environment variables
ls()
## B. If there exists, try clearing them out.
rm(list = ls())
## C. Next, restart your r studio 
.rs.restartR()
## D. Get to know the directory you are working with
getwd()
## Working directory is "/Users/lapuk/Desktop/Module4Project1"
## It is rather easier to start a new R project and
## Declare a new directory than to setwd() a new one. 
## Again,to make the project neat -- including the variables on the memory, start a new one


## Loading the data from "household_power_consumption.txt" to plot3data (in reference to the assignment)
## No need to complete the entire directory/location of the file since 
## I am working on the directory where the file is hosted. 
## From the raw data file (16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000)
## a separator parameter would separate the values; setting sep = ";"
plot3data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## Checking the dimension of the data set plot3data
dim(plot3data)
## [1] 2075259       9
## there are 2,075,259 entries with 9 columns (Date, Time, Global_active_power, 
## Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3) 
## from the source file "household_power_consumption.txt" (refer to the assignment description)
## Checking the initial content of the plot3data data set. 
head(plot3data)
## Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
## 1 16/12/2006 17:24:00               4.216                 0.418  234.84             18.4              0              1     17
## 2 16/12/2006 17:25:00               5.360                 0.436  233.63             23.0              0              1     16
## 3 16/12/2006 17:26:00               5.374                 0.498  233.29             23.0              0              2     17
## 4 16/12/2006 17:27:00               5.388                 0.502  233.74             23.0              0              1     17
## 5 16/12/2006 17:28:00               3.666                 0.528  235.68             15.8              0              1     17
## 6 16/12/2006 17:29:00               3.520                 0.522  235.02             15.0              0              2     17


plot3data$Date <- as.Date(plot3data$Date, format = "%d/%m/%Y")
## Converting the date and time format class
## checking the data$Date and its format (based on the format = "%d/%m/%Y")
head(plot3data$Date)
## [1] "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16"


## Taking all the necessary data from the given date of "2007-02-01" to "2007-02-02"
plot3subdata <- subset(plot3data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Checking for the dimension of the subset
dim(plot3subdata)
## [1] 2880    9
## There are 2880 records with 9 columns for 2007-02-01" to"2007-02-02"

## Checking the initial content of the subset
head(plot3subdata)
## Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
## 66637 2007-02-01 00:00:00               0.326                 0.128  243.15              1.4              0              0              0
## 66638 2007-02-01 00:01:00               0.326                 0.130  243.32              1.4              0              0              0
## 66639 2007-02-01 00:02:00               0.324                 0.132  243.51              1.4              0              0              0
## 66640 2007-02-01 00:03:00               0.324                 0.134  243.90              1.4              0              0              0
## 66641 2007-02-01 00:04:00               0.322                 0.130  243.16              1.4              0              0              0
## 66642 2007-02-01 00:05:00               0.320                 0.126  242.29              1.4              0              0              0


plot3subdata$datetime <- strptime(paste(plot3subdata$Date, plot3subdata$Time), "%Y-%m-%d %H:%M:%S")

dim(plot3subdata)
## [1] 2880   10
## There are still 2880 entries but this time with an additional column
## Created the "datetime" Column making it 10 dimensions

head(plot3subdata)
## Check at the last Column, "datetime" is added.
## Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3            datetime
## 66637 2007-02-01 00:00:00               0.326                 0.128  243.15              1.4              0              0              0 2007-02-01 00:00:00
## 66638 2007-02-01 00:01:00               0.326                 0.130  243.32              1.4              0              0              0 2007-02-01 00:01:00
## 66639 2007-02-01 00:02:00               0.324                 0.132  243.51              1.4              0              0              0 2007-02-01 00:02:00
## 66640 2007-02-01 00:03:00               0.324                 0.134  243.90              1.4              0              0              0 2007-02-01 00:03:00
## 66641 2007-02-01 00:04:00               0.322                 0.130  243.16              1.4              0              0              0 2007-02-01 00:04:00
## 66642 2007-02-01 00:05:00               0.320                 0.126  242.29              1.4              0              0              0 2007-02-01 00:05:00


## Manipulating the objects to represent the proper time and date variable on every entries
plot3subdata$datetime <- as.POSIXct(plot3subdata$datetime)

## Plotting Sub_metering_1 over the values of plot3subdata$datetime.
plot(Sub_metering_1 ~ plot3subdata$datetime, type = "l", ylab = "Energy sub metering", xlab = "")

## Adding lines to the graph having Sub_metering_2 over the values of plot3subdata$datetime.
## Using the color "Red" 
lines(Sub_metering_2 ~ plot3subdata$datetime, col = "Red")

## Adding lines to the graph having Sub_metering_3 over the values of plot3subdata$datetime.
## Using the color "Blue" 
lines(Sub_metering_3 ~ plot3subdata$datetime, col = "Blue")

## Using the legend command to plot the "Sub_metering_1" with corresponding color "black" on the text
## Adding parameters to the legend command for  "Sub_metering_2" with corresponding color "red" on the text
## Adding parameters to the legend command for "Sub_metering_3" with corresponding color "blue" on the text
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copying th graphics content of the current device and 
## Saving the graph as "plot3.png"
## Refer to the assignment guide for the png size (480 X 480)
dev.copy(png, file = "plot3.png", height = 480, width = 480)

# Signing Off from current graphic device(s)
dev.off()

## Clearing all environment variables
rm(list = ls())




