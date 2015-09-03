# Load data
dataraw <- read.table("household_power_consumption.txt", 
                      sep = ";", na.strings = "?", header = T)
# Subset data
data <- subset(dataraw, Date == "1/2/2007" | Date == "2/2/2007")

# Set handy format for Time variable
data$Time <- strptime(paste(data$Date, data$Time, sep = ""), "%d/%m/%Y %X")

# Make plot and save it to a png file
png("plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
with(data, plot(Time, Global_active_power, 
                type = "l", xlab= "", ylab = "Global Active Power (kilowattts)"))
dev.off()