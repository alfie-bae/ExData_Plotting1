# 
library(lubridate)
library(dplyr)
options(stringsAsFactors = FALSE)


household_power_consumption <- read.table("./household_power_consumption.txt",
                                          na.strings="?",
                                          sep = ";",
                                          header = TRUE)

energy_period <- household_power_consumption %>%
  filter(Date %in% c('1/2/2007', '2/2/2007')) %>%
  mutate(datetime = dmy_hms(paste(Date, Time)))

par(mfrow=c(1,1))
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
       pt.cex = 0.6,
       cex=0.6)

dev.print(png,'plot3.png',width=480, height=480)

dev.off()

