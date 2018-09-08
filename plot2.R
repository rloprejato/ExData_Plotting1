#library
library(dplyr)
library(lubridate)

#Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", 
                   stringsAsFactors=FALSE, na.strings = "?")

#subset data only for "1/2/2007","2/2/2007"
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

# Paste dates and times in Datetime
data <- data %>% mutate(Datetime = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))))

#create plot
with(data, plot(Datetime, Global_active_power, type="l", 
                xlab = "", ylab = "Global Active Power (kilowatts)"))

#save save file.png
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()