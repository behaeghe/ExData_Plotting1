##---
## name: plot3.R
## description: generate a plot based on electircal data consumption
## author: "JRB"
## date: "May 30, 2016"
## output: html_document
##---
png(file="plot3.png",height= 480,width=480,units="px") 
with(dfelec.filtered,plot(Date,Sub_metering_1, main="",ylab="Energy sub metering", type="n"))
lines(dfelec.filtered$Date,dfelec.filtered$Sub_metering_1)
lines(dfelec.filtered$Date,dfelec.filtered$Sub_metering_2,col="red")
lines(dfelec.filtered$Date,dfelec.filtered$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=1)
dev.off()