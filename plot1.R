# This is of the dataset in my PC. For cross check by running the script, set this variable appropriately.
dir = "C:/Users/Sandesh/Desktop/Coursera/Exploratory Data Analysis/household_power_consumption.txt"

#Dataset Creation:
DB <- read.csv2(dir,skip = 66637, nrows = 69517 - 66637, header = FALSE)
clnams <- read.csv2(dir, nrows = 1) #Dummy dataset for reading the column names
names(DB) <- names(clnams)
rm(clnams) #Why waste unnecessary memory?

#The Plot:
#Note: The Global_active_power is a factor variable. So, process needs to be done before plot.
hist(as.numeric(as.character(DB$Global_active_power)),col="red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,file = "plot1.png")
dev.off()