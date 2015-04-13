## Plot 4

## Read the lines relevant for the exercise using skip and nrows, and the column names,
## and set the column names to the data frame with the date
pwr <- read.table("household_power_consumption.txt", header = FALSE, sep = ";",
                  na.strings = "?", skip = 66637, nrows = 2880)
col <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?", nrows = 1) 
colnames(pwr) <- colnames(col)

# Create a time column with R date objects of class POSIXlt
pwr$Time2 = strptime(paste(pwr$Date, pwr$Time),"%d/%m/%Y %H:%M:%S")

# Save to a png file
png(file = "plot4.png")

# Arrange panel for four plots, added by columns
par( mfcol = c(2,2))

# Reproduce plot 2, minor change in y label
plot(pwr$Time2, pwr$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

# Reproduce plot 3, minor change in legend, i.e. no box
plot(pwr$Time2, pwr$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(pwr$Time2, pwr$Sub_metering_1, col = "black")
lines(pwr$Time2, pwr$Sub_metering_2, col = "red")
lines(pwr$Time2, pwr$Sub_metering_3, col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       )

# New plots
plot(pwr$Time2, pwr$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(pwr$Time2, pwr$Global_reactive_power, type = "l", xlab = "datetime")

# Always close device
dev.off()



