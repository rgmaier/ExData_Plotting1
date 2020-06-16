##Loading the data
data <- read.csv2("household_power_consumption.txt")
data$DateTime <- paste(data$Date," ",data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

##Subsetting to relevant date and converting datetime
newdata <- subset(data, DateTime < "2007-02-03" & DateTime >= "2007-02-01")
newdata$Global_active_power <- as.numeric(levels(newdata$Global_active_power))[newdata$Global_active_power]
newdata$Sub_metering_1 <- as.numeric(levels(newdata$Sub_metering_1))[newdata$Sub_metering_1]
newdata$Sub_metering_2 <- as.numeric(levels(newdata$Sub_metering_2))[newdata$Sub_metering_2]
newdata$Sub_metering_3 <- as.numeric(levels(newdata$Sub_metering_3))[newdata$Sub_metering_3]

##Creating the plot
png(file="plot3.png", bg="transparent", width=480, height=480, units="px")
plot(newdata$DateTime,newdata$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(newdata$DateTime, newdata$Sub_metering_2, type="l", col="green")
lines(newdata$DateTime, newdata$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","green","blue"), lty=1)
dev.off()