# plot 4

library(lubridate)
library(dplyr)
options(stringsAsFactors = FALSE)


household_power_consumption <- read.table("./household_power_consumption.txt",
                                          na.strings="?",
                                          sep = ";",
                                          header = TRUE)

par(mfrow=c(2,2))

plot(energy_period$datetime, 
     energy_period$Global_active_power,
     type="n",
     xlab = " ",
     ylab = "Global Active Power(kilowatts)")

lines(energy_period$datetime, 
      energy_period$Global_active_power)


plot(energy_period$datetime,
     energy_period$Voltage,
     type="n",
     ylab="Voltage",
     xlab="datetime")

lines(energy_period$datetime,
      energy_period$Voltage)


plot(energy_period$datetime, 
     energy_period$Sub_metering_1,
     type="n",
     xlab = " ",
     ylab = "Energy sub metering")

lines(energy_period$datetime, 
      energy_period$Sub_metering_1)

lines(energy_period$datetime, 
      energy_period$Sub_metering_2,
      col="red")

lines(energy_period$datetime, 
      energy_period$Sub_metering_3,
      col="blue")

legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), 
       lty=1:1,
       pt.cex = 0.2,
       cex=0.2)

plot(energy_period$datetime,
     energy_period$Global_reactive_power,
     type="n",
     ylab="Global_reactive_power",
     xlab="datetime")

lines(energy_period$datetime,
      energy_period$Global_reactive_power)

dev.copy(png,'plot4.png',width=480, height=480)

dev.off()
