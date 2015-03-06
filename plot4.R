## Read text file
hpc <- read.table ("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
## Subset data between February 1, 2007, and February 2, 2007
hpc_s <- hpc[(hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007"),]
hpc_s$DateTime <- strptime (paste(hpc_s$Date, hpc_s$Time), "%d/%m/%Y %H:%M:%S")
## Plot acording to specifications
png ("plot4.png")
## Create a 2 x 2 grid for plots.
par (mfrow = c(2,2))
## Create the plot in the upper left according to specifications
plot (hpc_s$DateTime, hpc_s$Global_active_power, type = "l",
      ylab = "Global Active Power", xlab = "")
## Create the plot in the upper right according to specifications
plot (hpc_s$DateTime, hpc_s$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
## Create the plot in the lower left according to specifications
plot (hpc_s$DateTime, hpc_s$Sub_metering_1, type = "l",
      ylab = "Energy sub metering", xlab = "")
points (hpc_s$DateTime, hpc_s$Sub_metering_2, type = "l", col = "red")
points (hpc_s$DateTime, hpc_s$Sub_metering_3, type = "l", col = "blue")
legend ("topright", col = c("black", "red", "blue"), lwd = 1, bty = "n", 
        legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Create the plot in the lower right according to specifications
plot (hpc_s$DateTime, hpc_s$Global_reactive_power, type = "l", ylab = "Global_reactive_power", 
      xlab = "datetime")
dev.off ()