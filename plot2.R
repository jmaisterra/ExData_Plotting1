#Read Data File
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#SubSet desired dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Set variable as Numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)
#Create Array by pasting date and time
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Open graphic device, create graph, close device
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
