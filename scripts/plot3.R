# Load data
dataraw <- read.table("household_power_consumption.txt", 
                      header = T, sep = ";", na.strings = "?")
# Subset data
data <- subset(dataraw, Date == "1/2/2007" | Date == "2/2/2007")

# Set handy format for Time variable
data$Time <- strptime(paste(data$Date, data$Time, sep = ""), "%d/%m/%Y %X")

# Make plots, add legend and save it to a png file
png("plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(data$Time, data$Sub_metering_1, 
     xlab = "", ylab = "Energy sub metering", type = "l")
lines(data$Time, data$Sub_metering_2, 
     col = "red", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_3, 
     col = "blue", xlab = "", ylab = "Energy sub metering")
legend("topright", col = c("black", "red", "blue"), 
       lty = c(1, 1, 1), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
