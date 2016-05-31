##---
## name: Plot1.R
## description: generate a plot based on electircal data consumption
## author: "JRB"
## date: "May 30, 2016"
## output: html_document
##---
png(file="plot1.png",height= 480,width=480,units="px") 
hist(dfelec.filtered$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)")
dev.off()