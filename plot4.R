#library
library(dplyr)
library(lubridate)
library(ggplot2)

#Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", 
                   stringsAsFactors=FALSE, na.strings = "?")

#subset data only for "1/2/2007","2/2/2007"
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

# Paste dates and times in Datetime
data <- data %>% mutate(Datetime = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))))

#create plot and save in plot3.png
png(file ="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(data, plot(Datetime, Global_active_power, type="l", 
                xlab = "", ylab = "Global Active Power"))

with(data, plot(Datetime, Voltage, type="l", 
                xlab = "datetime", ylab = "Voltage"))

with(data, plot(Datetime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
with(data, points(Datetime, Sub_metering_2, type="l", col="red"))
with(data, points(Datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

with(data, plot(Datetime, Global_reactive_power, type="l", xlab = "datetime"))

dev.off()



