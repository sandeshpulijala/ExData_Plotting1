# This is of the dataset in my PC. For cross check by running the script, set this variable appropriately.
dir = "C:/Users/Sandesh/Desktop/Coursera/Exploratory Data Analysis/household_power_consumption.txt"

#Dataset Creation:
DB <- read.csv2(dir,skip = 66637, nrows = 69517 - 66637, header = FALSE)
clnams <- read.csv2(dir, nrows = 1) #Dummy dataset for reading the column names
names(DB) <- names(clnams)
rm(clnams) #Why waste unnecessary memory?

#Processing: To plot against time, we need a new overall time variable.
DB$realTime <- strptime(paste(as.character(DB$Date),as.character(DB$Time)), format = "%d/%m/%Y %H:%M:%S")

#The Plot:
par(mar = c(3.1,4.1,1.1,1.1)) # Setting the margins for the plot. Because we don't have a title for this plot.
par(mfrow = c(2,2)) # Surely, because multiplot.
plot(DB$realTime,as.numeric(as.character(DB$Global_active_power)),type = "l",
     ylab = "Global Active Power", xlab = NULL)
par(mar = c(4.1,4.1,1.1,1.1))
plot(DB$realTime,as.numeric(as.character(DB$Voltage)),type = "l",
     ylab = "Voltage", xlab = "datetime")
par(mar = c(3.1,4.1,1.1,1.1))
plot(DB$realTime,as.numeric(as.character(DB$Sub_metering_1)),type = "l",ylab = "Energy sub metering")
points(DB$realTime,as.numeric(as.character(DB$Sub_metering_2)),type = "l",col = "red")
points(DB$realTime,as.numeric(as.character(DB$Sub_metering_3)),type = "l",col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c("solid","solid","solid"),col = c("black","red","blue"),cex = 0.75)
par(mar = c(4.1,4.1,1.1,1.1))
plot(DB$realTime,as.numeric(as.character(DB$Global_reactive_power)),type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")
par(mar = c(5.1,4.1,4.1,2.1)) # Resetting to originals.
dev.copy(png,file = "plot4.png")
dev.off()