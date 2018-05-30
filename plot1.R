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

# plot 1 - histogram of global active power
par(mfrow=c(1,1))
hist(energy_period$Global_active_power,
     col = 'red',
     main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)",
     ylab = "frequency")

dev.copy(png,'plot1.png',width=480, height=480)

dev.off()
