#Read Data File
file <- "household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#SubSet desired dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Set variable as Numeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

#Open graphic device, create graph, close device
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()