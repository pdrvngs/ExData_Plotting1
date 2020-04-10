library(lubridate)
household = read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = F)
household$Date_Time = paste(household$Date, household$Time)
household$Date = dmy(household$Date)
household$Date_Time = dmy_hms(household$Date_Time)
household$Global_active_power = as.numeric(household$Global_active_power)
household = household[household$Date == "2007-02-01" | household$Date == "2007-02-02",]

quartz("plot2.png")
plot(household$Date_Time, household$Global_active_power, type = "l", xlab = "", ylab = " Global Active Power (kilowatts)")
quartz.save("plot2.png", type = "png")
dev.off()
