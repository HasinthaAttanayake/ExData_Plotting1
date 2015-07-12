#read data from file in working directory (this is a must)
pwdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"))
#take a subset for the first two dats of february 2007
subdata <- pwdata[pwdata$Date == "1/2/2007" | pwdata$Date == "2/2/2007",]
#combine date and time into a single varaible and create new column
x <- paste(Date, Time)
subdata$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(subdata) <- 1:nrow(subdata)

#open png graphics device and plot graph
png("plot2.png", width = 480, height = 480)
plot(subdata$DateTime,subdata$Global_active_power, type = "l", xaxt ="n", xlab = "", ylab = "Global Active Power (Kilowatts)")
axis.POSIXct(1,as.POSIXct(subdata$DateTime,origin="1970-01-01"))
dev.off()




