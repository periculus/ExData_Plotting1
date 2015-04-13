## Plot 2

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
png(file = "plot2.png")
plot(pwr$Time2, pwr$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# Always close device
dev.off()

