#library
library(dplyr)

#Read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",dec=".", 
                   stringsAsFactors=FALSE, na.strings = "?")

#subset data only for "1/2/2007","2/2/2007"
data <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#create histogram
with(data, hist(Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatt)", 
     main = "Global Active Power"))

#save save file.png
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()