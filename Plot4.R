hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
hpcsub <- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007"))
hpcsub$Date <- as.Date(hpcsub$Date, "%d/%m/%Y")
hpcsub$DateTime <- paste(hpcsub$Date, hpcsub$Time, sep = " ")
hpcsub$DateTime <- strptime(hpcsub$DateTime, "%Y-%m-%d %H:%M:%S")

png("plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))

plot(hpcsub$DateTime, hpcsub$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=" ")

plot(hpcsub$DateTime, hpcsub$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(hpcsub$DateTime, hpcsub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=" ")
points(hpcsub$DateTime, hpcsub$Sub_metering_2, type="l", ylab=" ", xlab=" ", col = "red")
points(hpcsub$DateTime, hpcsub$Sub_metering_3, type="l", ylab=" ", xlab=" ", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot (hpcsub$DateTime, hpcsub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()