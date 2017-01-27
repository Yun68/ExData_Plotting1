Plot1 <- function(){
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
  ## change the factor variables to numeric variables
  
  hist(DataUse$Global_active_power, col = "red", xlab = "Global Active Power(kilowatts)", main = "Global Active Power")
  ## Plot the graphs with legends, if necessary
  
  dev.copy(png, file = "./data_power/Plot1.png")
  dev.off()
  ## Save the plot, 480*480 is default
}


