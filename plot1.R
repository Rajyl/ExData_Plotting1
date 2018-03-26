## Rajyl P. Muleta
## Module 4: Exploratory Data Analysis
## Project 1 : plot1.R
## Output: plot1.png


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


## Loading the data from "household_power_consumption.txt" to plot1data (in reference to the assignment)
## No need to complete the entire directory/location of the file since 
## I am working on the directory where the file is hosted.
## From the raw data file (16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000)
## a separator parameter would separate the values; setting sep = ";"
plot1data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## Checking the dimension of the data set plot1data
 dim(plot1data)
## [1] 2075259       9
## there are 2,075,259 entries with 9 columns (Date, Time, Global_active_power, 
## Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3) 
## from the source file "household_power_consumption.txt" (refer to the assignment description)
## Checking the initial content of the plot1data data set. 
 head(plot1data)
## Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
## 1 16/12/2006 17:24:00               4.216                 0.418  234.84             18.4              0              1     17
## 2 16/12/2006 17:25:00               5.360                 0.436  233.63             23.0              0              1     16
## 3 16/12/2006 17:26:00               5.374                 0.498  233.29             23.0              0              2     17
## 4 16/12/2006 17:27:00               5.388                 0.502  233.74             23.0              0              1     17
## 5 16/12/2006 17:28:00               3.666                 0.528  235.68             15.8              0              1     17
## 6 16/12/2006 17:29:00               3.520                 0.522  235.02             15.0              0              2     17


plot1data$Date <- as.Date(plot1data$Date, format = "%d/%m/%Y")
## Converting the date and time format class
## checking the data$Date and its format (based on the format = "%d/%m/%Y")
## head(plot1data$Date)
## [1] "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16"


## Taking all the necessary data from the given date of "2007-02-01" to "2007-02-02"
plot1subdata <- subset(plot1data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Checking for the dimension of the subset
dim(plot1subdata)
## [1] 2880    9
## There are 2880 records with 9 columns for 2007-02-01" to"2007-02-02"

## Checking the initial content of the subset
head(plot1subdata)
## Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1 Sub_metering_2 Sub_metering_3
## 66637 2007-02-01 00:00:00               0.326                 0.128  243.15              1.4              0              0              0
## 66638 2007-02-01 00:01:00               0.326                 0.130  243.32              1.4              0              0              0
## 66639 2007-02-01 00:02:00               0.324                 0.132  243.51              1.4              0              0              0
## 66640 2007-02-01 00:03:00               0.324                 0.134  243.90              1.4              0              0              0
## 66641 2007-02-01 00:04:00               0.322                 0.130  243.16              1.4              0              0              0
## 66642 2007-02-01 00:05:00               0.320                 0.126  242.29              1.4              0              0              0

## Plotting the Global Active Power from the stripped data using histogram
hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")


## Saving the plotted historgram as "plot1.png"
## Refer to the assignment guide for the png size (480 X 480)
dev.copy(png, file = "plot1.png", height = 480, width = 480)

# Signing Off from current graphic device(s)
dev.off()

## Clearing all environment variables
rm(list = ls())
