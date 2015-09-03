# Load data
dataraw <- read.table("household_power_consumption.txt", 
                      header = T, sep = ";", na.strings = "?")
# Subset data
data <- subset(dataraw, Date == "1/2/2007" | Date == "2/2/2007")

# Set handy format for Time variable
data$Time <- strptime(paste(data$Date, data$Time, sep = ""), "%d/%m/%Y %X")

# Create png file device with correct size and background
png("plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

# Set parameters
par(mfrow = c(2,2))

# 1st plot
with(data, plot(Time, Global_active_power, 
                type = "l", xlab= "", ylab = "Global Active Power"))

# 2nd plot
with(data, plot(Time, Voltage, xlab = "datatime", ylab = "Voltage", type = "l"))

# 3rd plot
with(data, {
    plot(Time, Sub_metering_1, 
     xlab = "", ylab = "Energy sub metering", type = "l")
    lines(Time, Sub_metering_2, 
      col = "red", xlab = "", ylab = "Energy sub metering")
    lines(Time, Sub_metering_3, 
      col = "blue", xlab = "", ylab = "Energy sub metering")
    legend("topright", col = c("black", "red", "blue"), 
       lty = c(1, 1, 1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# 4th plot
with(data, plot(Time, Global_reactive_power, type = "l", xlab = "datatime"))

# Close the connection
dev.off()