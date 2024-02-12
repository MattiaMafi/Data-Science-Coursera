

destfile <- "C:/Users/suchi/Documents/R_script/Data-Science-Coursera/download_data/household_power_consumption.txt"
household_data <- read.table(destfile, skip=1, sep = ";")

head(household_data)

names(household_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                            "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
head(household_data)

sub_household_data <- subset(household_data, household_data$Date=='1/2/2007' | household_data$Date=='2/2/2007')
#We will only be using data from the dates 2007-02-01 and 2007-02-02


#Q1
hist(as.numeric(as.character(sub_household_data$Global_active_power)), col = 'red', 
          main = "Global Active Power", xlab="Global Active Power(kilowatts)")

#Q2
Sys.setlocale("LC_TIME", "English")
date_converted <- as.Date(sub_household_data$Date, format="%d/%m/%Y")
time_converted <- strptime(sub_household_data$Time, format="%H:%M:%S")
time_axis <- as.POSIXct(paste(date_converted, sub_household_data$Time))


plot(time_axis, sub_household_data$Global_active_power, type="l",
          main = "Global Active Power Vs Time", xlab="", ylab="Global Active Power (kilowatts)")





#Q3
plot(time_axis, sub_household_data$Sub_metering_1, 
     xlab = "", ylab = "Energy sub metering", type = "l",
     main = "Energy sub-metering")
lines(time_axis, sub_household_data$Sub_metering_2, col = "red")
lines(time_axis, sub_household_data$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red","blue"),lty=1, cex = 0.8,bty = "n")


#Q4

par(mfrow = c(2,2))
plot(time_axis, sub_household_data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
plot(time_axis, sub_household_data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(time_axis, sub_household_data$Sub_metering_1, 
     xlab = "", ylab = "Energy sub metering", type = "l",
     main = "Energy sub-metering")
lines(time_axis, sub_household_data$Sub_metering_2, col = "red")
lines(time_axis, sub_household_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red","blue"), cex = 0.7, lty = 1 , bty = "n", y.intersp=0.2)

plot(time_axis, sub_household_data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

