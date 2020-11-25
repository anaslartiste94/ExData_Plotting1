data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Time, data$Date) , "%H:%M:%S %d/%m/%Y")

filtered_data <- data[data$Date == as.Date("1/2/2007", "%d/%m/%Y") | data$Date == as.Date("2/2/2007", "%d/%m/%Y"),]

with(filtered_data, plot(Time, Sub_metering_1 , type = "n", xlab ="", ylab = "Energy sub metering"))
with(filtered_data, lines(Time, Sub_metering_1 , type = "l", col = "black"))
with(filtered_data, lines(Time, Sub_metering_2 , type = "l", col = "red"))
with(filtered_data, lines(Time, Sub_metering_3 , type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.copy(png, "plot3.png")
dev.off()