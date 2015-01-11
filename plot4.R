file <- read.table(".\\household_power_consumption.txt", sep = ";")
colnames(file) = as.character(unlist(file[1,]))
file1 <- file[file$Date=='1/2/2007' | file$Date=='2/2/2007', ]
file1[,3] <- as.numeric(as.character(file1[,3]))

par(mfcol = c(2,2), oma = c(0,0,0,0))
file1$DateTime <- paste(file1$Date, file1$Time)
file1$DateTime <- as.POSIXct(paste(file1$Date,file1$Time), format="%d/%m/%Y %H:%M:%S")
with(file1, plot(DateTime,Global_active_power,pch="",
                 lines(DateTime,Global_active_power), ylab="Global Active Power", xlab =''))

file1$Sub_metering_2 <- as.numeric(as.character(file1$Sub_metering_2))
file1$Sub_metering_1 <- as.numeric(as.character(file1$Sub_metering_1))
file1$Sub_metering_3 <- as.numeric(as.character(file1$Sub_metering_3))
with(file1, {plot(DateTime,Sub_metering_1,pch="",
                  lines(DateTime,Sub_metering_1,col="black"), ylab="Energy Sub Metering", xlab='')})
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  bg = "transparent", box.col = "transparent", cex = 0.55)

lines(file1$DateTime,file1$Sub_metering_2,col="red")
lines(file1$DateTime,file1$Sub_metering_3,col="blue") 

file1$Voltage <- as.numeric(as.character(file1$Voltage))
with(file1, plot(DateTime,Voltage,pch="",
                 lines(DateTime,Voltage), ylab="Voltage", xlab = "datetime"))


file1$Global_reactive_power <- as.numeric(as.character(file1$Global_reactive_power))
with(file1, plot(DateTime,Global_reactive_power,pch="",
                 lines(DateTime,Global_reactive_power), ylab="Global_reactive_power", xlab ='datetime'))

dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
