houseHoldFile <- file.choose()
plotData <- read.table(houseHoldFile, header = T, sep = ";", na.strings = "?")

finalData <- plotData[plotData$Date %in% c("1/2/2007" , "2/2/2007"), ]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
#plot 4
png( filename = "Plot4.png", width = 480, height = 480)
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
par(mfcol = c(2,2))
plot(finalData$SetTime, finalData$Global_active_power, type = "l" ,
     col = "black", xlab = "", ylab = "Global Active Power")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col=columnlines[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
plot(finalData$SetTime, finalData$Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage")
plot(finalData$SetTime, finalData$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()