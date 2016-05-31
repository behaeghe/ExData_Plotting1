##---
## name: Plot2.R
## description: generate a plot based on electircal data consumption
## author: "JRB"
## date: "May 30, 2016"
## output: html_document
##---
png(file="plot2.png",height= 480,width=480,units="px") 
with(dfelec.filtered,plot(Date,Global_active_power, main="",ylab="Global Active Power (Kilowatts)" ,type="n"))
with(dfelec.filtered,lines(Date,Global_active_power))
dev.off()