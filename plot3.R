## Plot 3

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
png(file = "plot3.png")

# First draw empty plot based on data with most dynamic range
plot(pwr$Time2, pwr$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")

# Then produce each of the lines, specify each color
lines(pwr$Time2, pwr$Sub_metering_1, col = "black")
lines(pwr$Time2, pwr$Sub_metering_2, col = "red")
lines(pwr$Time2, pwr$Sub_metering_3, col = "blue")

# Draw the legend, specify position and type etc.
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Always close device
dev.off()


