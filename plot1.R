## Read text file
hpc <- read.table ("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
## Subset data between February 1, 2007, and February 2, 2007
hpc_s <- hpc[(hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007"),]
## Create histogram according to specifications
png ("plot1.png")
hist (hpc_s$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
      col = "red")
dev.off ()