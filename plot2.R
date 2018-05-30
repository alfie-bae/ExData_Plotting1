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
     energy_period$Global_active_power,
     type="n",
     xlab = " ",
     ylab = "Global Active Power(kilowatts)")

lines(energy_period$datetime, 
      energy_period$Global_active_power)

dev.copy(png,'plot2.png',width=480, height=480)

dev.off()
