##---
## name: Plot1.R
## description: generate a plot based on electircal data consumption
## author: "JRB"
## date: "May 30, 2016"
## 
##---
##  ============================================================================
##  NOTE: 
##  This assumes that you have a file names household_power_consumption.txt is a
##  subdir named data off your working dir.
##  If you don't have a copy of the file, run getPowerFile.R first 
##  ===========================================================================
##   * Loading the data in R        *
##  data file is a semi-colon separated file, header has col names
dfelec <- read.table(file.path("./data","household_power_consumption.txt"),sep=";", stringsAsFactors = FALSE,header= TRUE)
## convert date string to date class and subset according to date 
if (!require(lubridate)) { install.packages("lubridate")}
if (!require(dplyr)){ install.packages("dplyr")}
dfelec$Date <- trimws(paste(dfelec$Date,dfelec$Time," "),which="both")
dfelec$Date <- dmy_hms(dfelec$Date)
startdate <- ymd_hms("2007-02-01 00:00:00")
enddate <- ymd_hms("2007-02-02 23:59:59")
## subset to date range of interest
dfelec.filtered <- subset(dfelec, Date %in% startdate:enddate)
## convert str to numeric
dfelec.filtered <- dfelec.filtered %>% 
    transmute(Date=Date,Time=Time,Global_active_power = as.numeric(Global_active_power),
              Global_reactive_power=as.numeric(Global_reactive_power),
              Voltage = as.numeric(Voltage),
              Global_intensity=as.numeric(Global_intensity),
              Sub_metering_1=as.numeric(Sub_metering_1),
              Sub_metering_2=as.numeric(Sub_metering_2),
              Sub_metering_3=as.numeric(Sub_metering_3))
## 
## * end of data loading *
png(file="plot1.png",height= 480,width=480,units="px") 
hist(dfelec.filtered$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)")
dev.off()