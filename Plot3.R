# Exploratory data analysis - Plot 1

# Load data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", comment.char = "")

# convert the date variable with the as.Date function
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data
df <- subset(data , data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Convert  Time variables to Time classes using the strptime()
df$datetime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

# Plot 3
png("Plot3.png", width = 480, height = 480)
with(df, plot(datetime, Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering"))
with(df, lines(datetime, Sub_metering_2, type="l", xlab=" ", col="red"))
with(df, lines(datetime, Sub_metering_3, type="l", xlab=" ", col="blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()





