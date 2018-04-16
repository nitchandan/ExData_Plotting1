#COURSE ON EXPLORATORY DATA ANALYSIS

# WEEK 1 PROJECT - Plot1

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

#5. Plot 1
attach(data)
hist(Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(data)