houseHoldFile <- file.choose()
plotData <- read.table(houseHoldFile, header = T, sep = ";", na.strings = "?")

finalData <- plotData[plotData$Date %in% c("1/2/2007" , "2/2/2007"), ]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
#plot 2
png( filename = "Plot2.png", width = 480, height = 480)
plot(finalData$SetTime, finalData$Global_active_power, type="l", 
     col="black", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

