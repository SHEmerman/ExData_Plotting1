## Read text file
hpc <- read.table ("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
## Subset data between February 1, 2007, and February 2, 2007
hpc_s <- hpc[(hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007"),]
hpc_s$DateTime <- strptime (paste(hpc_s$Date, hpc_s$Time), "%d/%m/%Y %H:%M:%S")
## Plot acording to specifications
png ("plot2.png")
plot (hpc_s$DateTime, hpc_s$Global_active_power, type = "l",
      ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off ()