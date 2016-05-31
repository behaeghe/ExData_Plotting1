## Run this to aquire the needed file for programing assignment of week 1
fileurl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename = "elecpwrcons.zip"
date.downloaded <- Sys.Date()
if (!dir.exists("./data")) { 
    dir.create("./data")}
if (!file.exists(file.path("./data",filename))) {
    elecfile <- download.file(url=fileurl,destfile=file.path("./data",filename),method="curl")
    unzip(file.path("./data",filename),exdir="./data")
}
