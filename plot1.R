
file <- read.table(".\\household_power_consumption.txt", sep = ";")
colnames(file) = as.character(unlist(file[1,]))
file1 <- file[file$Date=='1/2/2007' | file$Date=='2/2/2007', ]
file1[,3] <- as.numeric(as.character(file1[,3]))

hist(file1$Global_active_power, col="red", breaks=12, main="Global Active Power", xlab = "Global Active Power (kilowatts)")
#png(file = "myplot.png", width=480, height=480)
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()