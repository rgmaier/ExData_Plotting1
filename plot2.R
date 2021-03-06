##Loading the data
data <- read.csv2("household_power_consumption.txt")
data$DateTime <- paste(data$Date," ",data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

##Subsetting to relevant date and converting datetime
newdata <- subset(data, DateTime < "2007-02-03" & DateTime >= "2007-02-01")
newdata$Global_active_power <- as.numeric(levels(newdata$Global_active_power))[newdata$Global_active_power]

##Creating the plot
png(file="plot2.png", bg="transparent", width=480, height=480, units="px")
plot(newdata$DateTime,newdata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()