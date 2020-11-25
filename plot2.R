data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(paste(data$Time, data$Date) , "%H:%M:%S %d/%m/%Y")

filtered_data <- data[data$Date == as.Date("1/2/2007", "%d/%m/%Y") | data$Date == as.Date("2/2/2007", "%d/%m/%Y"),]

with(filtered_data, plot(Time, Global_active_power, type="n", xlab ="", ylab = "Global Active Power (kilowatts)"))
with(filtered_data, lines(Time, Global_active_power, type="l"))

dev.copy(png, "plot2.png")
dev.off()