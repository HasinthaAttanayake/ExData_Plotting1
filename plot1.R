#read data from file in working directory (this is a must)
pwdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))
#take a subset for the first two dats of february 2007
subdata <- pwdata[pwdata$Date == "1/2/2007" | pwdata$Date == "2/2/2007",]
#open png graphics device and plot histogram
png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, col = "Red",main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency")
dev.off()


