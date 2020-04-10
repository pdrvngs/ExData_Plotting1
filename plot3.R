library(lubridate)
household = read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = F)
household$Date_Time = paste(household$Date, household$Time)
household$Date = dmy(household$Date)
household$Date_Time = dmy_hms(household$Date_Time)
household$Global_active_power = as.numeric(household$Global_active_power)
household = household[household$Date == "2007-02-01" | household$Date == "2007-02-02",]

quartz("plot3.png")
plot(household$Date_Time, household$Sub_metering_1, type = "l", xlab= "", ylab= "Energy sub metering")
lines(household$Date_Time, household$Sub_metering_2, col= "red")
lines(household$Date_Time, household$Sub_metering_3, col= "blue")
legend("topright", legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), 
       col = c("black", "red" , "blue"), pch = "_")
quartz.save("plot3.png", type = "png")
dev.off()
