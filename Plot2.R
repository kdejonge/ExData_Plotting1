# Exploratory data analysis - Plot 1

# Load data
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", comment.char = "")

# convert the date variable with the as.Date function
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data
df <- subset(data , data$Date == "2007-02-01" | data$Date == "2007-02-02")

# Convert  Time variables to Time classes using the strptime()
df$datetime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2
png("Plot2.png", width = 480, height = 480)
(with(df, plot(datetime, Global_active_power, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")))
dev.off()





