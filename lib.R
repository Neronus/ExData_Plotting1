consumption <- read.csv("relevant.csv")
consumption$DateTime <- as.POSIXct(strptime(paste(consumption$Date, consumption$Time), "%Y-%m-%d %H:%M:%S"))

plot1 <- function() {
	hist(consumption$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="")
}

plot2 <- function() {
	with(consumption, {
		 plot(Global_active_power ~ DateTime, type="n",
			  ylab="Global Active Power (kilowatts)",
			  xlab=NA)
		 lines(DateTime, Global_active_power, lty=1)})
}

plot3 <- function() {
	with(consumption, {
		 plot(Sub_metering_1 ~ DateTime, type="n", xlab="", ylab="Energy sub metering")
		 lines(DateTime, Sub_metering_1, col="black")
		 lines(DateTime, Sub_metering_2, col="red")
		 lines(DateTime, Sub_metering_3, col="blue")
		 legend("topright", "(x, y)", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
	})
}

plot4 <- function() {
	par(mfcol=c(2,2))
	with(consumption, {
		 plot1()
		 plot2()
		 plot(Voltage ~ DateTime, type="n")
		 lines(DateTime, Voltage, lty=1)
		 plot(Global_reactive_power ~ DateTime, type="n")
		 lines(DateTime, Global_reactive_power, lty=1)})
}

