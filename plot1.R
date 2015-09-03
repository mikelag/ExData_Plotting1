# Load data
dataraw <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", as.is = T, header = T)

# Subset data
data <- subset(dataraw, Date == "1/2/2007" | Date == "2/2/2007")

# Plot histogram and save it to the png file
png("plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
