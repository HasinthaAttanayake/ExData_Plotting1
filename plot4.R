#read data from file in working directory (this is a must)
pwdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))
#take a subset for the first two dats of february 2007
subdata <- pwdata[pwdata$Date == "1/2/2007" | pwdata$Date == "2/2/2007",]
#combine date and time into a single varaible and create new column
x <- paste(Date, Time)
subdata$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(subdata) <- 1:nrow(subdata)

x1 <- subdata$DateTime
y1 <- subdata$Sub_metering_1
y2 <- subdata$Sub_metering_2
y3 <- subdata$Sub_metering_3

#open png graphics device and plot
png("plot4.png", width=480, height = 480)
#2 by 2 graphing area suitable for 4 plots
par(mfcol = c(2,2))
#topleft
plot(x1,subdata$Global_active_power, type = "l", xaxt ="n", xlab = "", ylab = "Global Active Power")
axis.POSIXct(1,as.POSIXct(subdata$DateTime,origin="1970-01-01"))
#bottomleft
plot(x1,y1,type = "l",col = "black",xaxt="n",xlab = "", ylab = "Energy Sub Metering")
lines(x1,y2,type = "l",col = "red")
lines(x1,y3,type = "l",col = "blue")
axis.POSIXct(1,as.POSIXct(subdata$DateTime,origin="1970-01-01"))
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1), bty = "n",col = c("black","red","blue"))
#topright
plot(x1, subdata$Voltage, type = "l",xaxt ="n", xlab = "datetime", ylab = "Voltage")
axis.POSIXct(1,as.POSIXct(subdata$DateTime,origin="1970-01-01"))
#bottomright
plot(x1,subdata$Global_reactive_power,type = "l", xaxt ="n", xlab = "datetime", ylab = "Global_reactive_power")
axis.POSIXct(1,as.POSIXct(subdata$DateTime,origin="1970-01-01"))
dev.off()