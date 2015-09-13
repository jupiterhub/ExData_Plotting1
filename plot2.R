# Plot 2
# Plot of Global Active Power vs day

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

# Drop the now-unnecessary date and time cols
data$Date=NULL
data$Time=NULL

# Subset the data to only look at desired time span
# Here we'll be working with data from 2007-02-01 to 2007-02-02.
sub_data = subset(data,as.Date(data$Timestamp) >= "2007-02-01" 
                  & as.Date(data$Timestamp) < "2007-02-03")

# Start the png device
png(filename="plot2.png", height=480, width=480, bg="transparent")

# Plot the line
plot(sub_data$Timestamp,
     sub_data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Save the figure
dev.off()