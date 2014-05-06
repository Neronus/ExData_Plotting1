if (!exists("consumption")) {
	consumption <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
	consumption$Date <- as.Date(strptime(consumption$Date, "%d/%m/%Y"))
}

relevant <- subset(consumption, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

write.csv(relevant, "relevant.csv")
