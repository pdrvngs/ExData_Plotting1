library(lubridate)
household = read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = F)
household$Date = dmy(household$Date)
household$Global_active_power = as.numeric(household$Global_active_power)
household = household[household$Date == "2007-02-01" | household$Date == "2007-02-02",]


quartz("plot1.png")
hist(household$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "RED", main = "Global Active Power")
quartz.save("plot1.png", type = "png")
dev.off()
