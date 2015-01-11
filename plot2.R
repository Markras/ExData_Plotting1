
file <- read.table(".\\household_power_consumption.txt", sep = ";")
colnames(file) = as.character(unlist(file[1,]))
file1 <- file[file$Date=='1/2/2007' | file$Date=='2/2/2007', ]
file1[,3] <- as.numeric(as.character(file1[,3]))

file1$DateTime <- paste(file1$Date, file1$Time)
file1$DateTime <- as.POSIXct(paste(file1$Date,file1$Time), format="%d/%m/%Y %H:%M:%S")
with(file1, plot(DateTime,Global_active_power,pch="",
                 lines(DateTime,Global_active_power), ylab="Global Active Power (kilowatts)", xlab =''))
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()