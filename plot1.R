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

df3 = subset(household_power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02" )

png(filename = "EDP_1_1.png", width = 480, height = 480)
hist(as.numeric(df3$Global_active_power), 
      breaks=15,
      xlab = "Global Active Power (kilowatts)"
      ylab = "Frequency"
      main = "Global Active Power"
      col = "red")
dev.off()

