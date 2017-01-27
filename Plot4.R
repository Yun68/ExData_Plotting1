Plot4 <- function(){
  library(datasets)
  Sys.setlocale()
  Sys.setlocale(locale = "English")
  ## set the system in English
  
  Data <- read.csv2("./data_power/power.txt", header = TRUE)
  ## Read original data
  
  DataUse <- subset(Data, Date %in% c("1/2/2007","2/2/2007"))
  DataUse$DateTime <- paste(DataUse$Date, DataUse$Time)
  DataUse$DateTime <- as.POSIXlt(DataUse$DateTime, format = "%d/%m/%Y %H:%M:%S")
  ## Extract data for two days of 2007-02-01 and 2007-02-02 and convert date and time to POSIXlt date and time class
  
  DataUse$Global_active_power <- as.numeric(levels(DataUse$Global_active_power))[DataUse$Global_active_power]
  DataUse$Voltage <- as.numeric(levels(DataUse$Voltage))[DataUse$Voltage]
  DataUse$Sub_metering_1 <- as.numeric(levels(DataUse$Sub_metering_1))[DataUse$Sub_metering_1]
  DataUse$Sub_metering_2 <- as.numeric(levels(DataUse$Sub_metering_2))[DataUse$Sub_metering_2]
  DataUse$Sub_metering_3 <- as.numeric(levels(DataUse$Sub_metering_3))[DataUse$Sub_metering_3]
  DataUse$Global_reactive_power <- as.numeric(levels(DataUse$Global_reactive_power))[DataUse$Global_reactive_power]
  ## change the factor variables to numeric variables
  
  par(mfrow = c(2,2))
  ## Set the layout of the graphs 
  with(DataUse, plot(DateTime, Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power"))
  with(DataUse, plot(DateTime, Voltage, type = 'l', xlab = "datetime", ylab = "Voltage"))
  with(DataUse, plot(DateTime, Sub_metering_1, type = 'l', xlab = "", ylab="Energy sub metering" ))
  with(DataUse, lines(DateTime, Sub_metering_2, type = 'l', col = "red"))
  with(DataUse, lines(DateTime, Sub_metering_3, type = 'l', col = "blue"))
  legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)
  with(DataUse, plot(DateTime, Global_reactive_power, type = 'l', xlab = "datetime"))
  ## Plot the graphs with legends, if necessary
  
  dev.copy(png, file = "./data_power/Plot4.png")
  dev.off()
  ## Save the plot, 480*480 is default
}


