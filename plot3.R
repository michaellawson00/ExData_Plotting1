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
png(filename = "EDP_1_3.png", width = 480, height = 480)
X <- as.POSIXct(paste(df3$Date, df3$Time), format="%Y-%m-%d %H:%M:%S")
plot(X, df3$Sub_metering_1, 
     type='l',
     xlab = "",
     ylab = "Energy sub metering")
lines(X, df3$Sub_metering_2, type='l',col="red")
lines(X, df3$Sub_metering_3, type='l',col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()