## Plot 1

## Read the lines relevant for the exercise using skip and nrows, and the column names,
## and set the column names to the data frame with the date
pwr <- read.table("household_power_consumption.txt", header = FALSE, sep = ";",
                  na.strings = "?", skip = 66637, nrows = 2880)
col <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                  na.strings = "?", nrows = 1) 
colnames(pwr) <- colnames(col)

# Save to a png file
png(file = "plot1.png")

hist(pwr$Global_active_power, col = "red", main = "Global Active Power",
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)")

# Always close device
dev.off()
