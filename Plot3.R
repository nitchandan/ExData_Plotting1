#COURSE ON EXPLORATORY DATA ANALYSIS

# WEEK 1 PROJECT - Plot3

#######################################

#1.Loading data 
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
#2. Transform the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#3. Subset the data for 2 days of February
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#4. Combining date and time
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

#5. Plot 3
data$datetime <- as.POSIXct(data$datetime)

attach(data)
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
detach(data)