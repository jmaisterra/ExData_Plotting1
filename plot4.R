#Read Data File
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#SubSet desired dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Set variables as Numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#Create Array by pasting date and time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Open graphic device
png("plot4.png", width=480, height=480)
#Cretae grid 2 by 2
par(mfrow = c(2, 2)) 

#Create TOP LEFT graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Create TOP RIGHT graph
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Create BOTTOM LEFT graph
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Create BOTTOM RIGHT graph
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()