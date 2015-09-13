# Plot 1
# Histogram of Frequency vs Global Active Power

# Read in the power consumption data set
# First two columns will be converted to date/time in next step
# "?" is the NA characted in this set, so designate it as such
data <- read.csv("household_power_consumption.txt",
                 sep=";",
                 colClasses=c(rep("character",2),rep("numeric",7)),
                 na.strings="?")

# Combine the date and time columns into one timestapm
data$Timestamp <- strptime(paste(data$Date,data$Time),
                           format="%d/%m/%Y %H:%M:%S")


# Subset the data to only look at desired time span
# Here we'll be working with data from 2007-02-01 to 2007-02-02.
sub_data = subset(data,as.Date(data$Timestamp) >= "2007-02-01" 
                     & as.Date(data$Timestamp) < "2007-02-03")

# Start the png device
png(filename="plot1.png", height=480, width=480, bg="transparent")

# Plot the histogram
hist(sub_data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

# Save the figure
dev.off()