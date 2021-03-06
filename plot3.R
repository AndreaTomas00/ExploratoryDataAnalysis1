unzip("C:/Users/antop/Documents/R/ExploratoryDataAnalysis1/exdata_data_household_power_consumption.zip")
dt <- read.table("C:/Users/antop/Documents/R/ExploratoryDataAnalysis1/household_power_consumption.txt", header =TRUE, sep=";", na.strings="?")
data <- subset(dt, dt$Date %in% c("1/2/2007", "2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(data$Date, data$Time)
data$datetime <- as.POSIXct(datetime)
png("plot3.png", width=480, height=480)
with(data, {plot(Sub_metering_1 ~ datetime, type ="l", ylab="Global Active Power (kilowatts)", xlab="") 
  lines(Sub_metering_2 ~datetime, col="red") 
  lines(Sub_metering_3 ~datetime, col="blue")})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
dev()
