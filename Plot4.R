# Exploratory data analysis - Plot 1

# Load data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", comment.char = "")

# convert the date variable with the as.Date function
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data
df <- subset(data , data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Convert  Time variables to Time classes using the strptime()
df$datetime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

# Plot 4
png("Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

# Plot 4-1
with(df, plot(datetime, Global_active_power, type = "l", xlab =" ", ylab = "Global Active Power (kilowatts)"))

# Plot 4-2
with(df, plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# Plot 4-3
with(df, plot(datetime, Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering"))
with(df, lines(datetime, Sub_metering_2, type="l", xlab=" ", col="red"))
with(df, lines(datetime, Sub_metering_3, type="l", xlab=" ", col="blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Plot 4-4
with(df, plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global reactive power"))

dev.off()




with(mydata,plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()



