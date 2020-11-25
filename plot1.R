data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Time, data$Date) , "%H:%M:%S %d/%m/%Y")

filtered_data <- data[data$Date == as.Date("1/2/2007", "%d/%m/%Y") | data$Date == as.Date("2/2/2007", "%d/%m/%Y"),]

hist(filtered_data$Global_active_power, col = "orange", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, "plot1.png")
dev.off()