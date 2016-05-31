##---
## name: plot4.R
## description: generate a plot based on electircal data consumption
## author: "JRB"
## date: "May 30, 2016"
## output: html_document
##---
png(file="plot4.png",height= 480,width=480,units="px") 
par(mfcol=c(2,2),mar = c(4,4,2,1),oma=c(0,0,2,0))
##Plot 2
with(dfelec.filtered,plot(Date,Global_active_power, main="",ylab="Global Active Power (Kilowatts)" ,type="n"))
with(dfelec.filtered,lines(Date,Global_active_power))
## Plot 3
with(dfelec.filtered,plot(Date,Sub_metering_1, main="",ylab="Energy sub metering", type="n"))
lines(dfelec.filtered$Date,dfelec.filtered$Sub_metering_1)
lines(dfelec.filtered$Date,dfelec.filtered$Sub_metering_2,col="red")
lines(dfelec.filtered$Date,dfelec.filtered$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=1)
## Voltage
with(dfelec.filtered,plot(Date,Voltage,type="n",main="",ylab="Voltage",xlab="datetime"))
lines(dfelec.filtered$Date,dfelec.filtered$Voltage)

##Reactivepower
with(dfelec.filtered,plot(Date,Global_reactive_power,type="n",main="",xlab="datetime"))
lines(dfelec.filtered$Date,dfelec.filtered$Global_reactive_power)

dev.off()