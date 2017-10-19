library(readr)
household_power_consumption <- read_delim("C:/Users/Mike/Dropbox/MOOC/R Programming/household_power_consumption.txt", 
                                          ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                                                                       Global_active_power = col_character(), 
                                                                                       Global_intensity = col_character(), 
                                                                                       Global_reactive_power = col_character(), 
                                                                                       Sub_metering_1 = col_character(), 
                                                                                       Sub_metering_2 = col_character(), 
                                                                                       Sub_metering_3 = col_character(), 
                                                                                       Time = col_time(format = "%H:%M:%S"), 
                                                                                       Voltage = col_character()), trim_ws = TRUE)
X <- as.POSIXct(paste(df3$Date, df3$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "EDP_1_4.png", width = 480, height = 480)
par(mfcol=c(2,2))

plot(X, df3$Global_active_power, 
     type='l',
     xlab = "",
     ylab = "Global Active Power")


plot(X, df3$Sub_metering_1, 
     type='l',
     xlab = "",
     ylab = "Energy sub metering")
lines(X, df3$Sub_metering_2, type='l',col="red")
lines(X, df3$Sub_metering_3, type='l',col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty ="n")

plot(X, df3$Voltage, 
     type='l',
     xlab = "datetime",
     ylab = "Voltage")

plot(X, df3$Global_reactive_power, 
     type='l',
     xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()
