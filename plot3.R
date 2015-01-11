file <- read.table(".\\household_power_consumption.txt", sep = ";")
colnames(file) = as.character(unlist(file[1,]))
file1 <- file[file$Date=='1/2/2007' | file$Date=='2/2/2007', ]
file1[,3] <- as.numeric(as.character(file1[,3]))

file1$Sub_metering_2 <- as.numeric(as.character(file1$Sub_metering_2))
file1$Sub_metering_1 <- as.numeric(as.character(file1$Sub_metering_1))
file1$Sub_metering_3 <- as.numeric(as.character(file1$Sub_metering_3))
with(file1, {plot(DateTime,Sub_metering_1,pch="",
                  lines(DateTime,Sub_metering_1,col="black"), ylab="Energy Sub Metering", xlab='')})
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.65)

lines(file1$DateTime,file1$Sub_metering_2,col="red")
lines(file1$DateTime,file1$Sub_metering_3,col="blue") 
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()