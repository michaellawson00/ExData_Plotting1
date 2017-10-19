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
png(filename = "EDP_1_2.png", width = 480, height = 480)
plot(as.POSIXct(paste(df3$Date, df3$Time), 
                format="%Y-%m-%d %H:%M:%S"), 
     df3$Global_active_power, 
     type='l',
     xlab = "",
     ylab = "Global Active Power(kilowatts)")
dev.off()