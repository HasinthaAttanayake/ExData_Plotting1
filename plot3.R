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

#Open png graphics device and plot graph
png("plot3.png", width = 480, height = 480)
plot(x1,y1,type = "l",col = "black",xaxt="n",xlab = "", ylab = "Energy Sub Metering")
#use lines to superimpose data
lines(x1,y2,type = "l",col = "red")
lines(x1,y3,type = "l",col = "blue")
axis.POSIXct(1,as.POSIXct(subdata$DateTime,origin="1970-01-01"))
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1),col = c("black","red","blue"))
dev.off()
