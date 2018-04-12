# Exploratory data analysis - Plot 1

# Load data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", comment.char = "")

# convert the date variable with the as.Date function
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data
df <- subset(data , data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Convert  Time variables to Time classes using the strptime()
df$datetime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

# Plot 1
png("Plot1.png", width = 480, height = 480)
hist(df$Global_active_power, xlab = "Global Active Power (kilowatts)" , col="red", main="Global Active Power")
dev.off()



