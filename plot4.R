# plot4.R
# Plot values of Global active power use, voltage, submetered power use 
# and Global reactive power use vs time over a 2-day period
#
# Code for getting and filtering data is in a separate function,
# in a file getFilteredData.R, in the same directory as this file.
#
# load the function
source("getFilteredData.R")

# get the filtered data, and make the plot
filt <- getFilteredData()
# create plots on screen device, 2 rows of 2 columns
par(mfrow= c(2,2))
# 1: Global Active Power usage in kilowatts versus time (plot2.R)
plot(filt$DateTime,
     filt$Global_active_power, 
     type = "l",
     ylab = "Global Active Power",
     xlab = "")
# 2: voltage vs time
plot(filt$DateTime,
     filt$Voltage, 
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")
# 3: submetering plot (plot3.R)
# make plot of 1st variable
plot(filt$DateTime,
     filt$Sub_metering_1, 
     type = "l",
     ylab = "Energy sub metering",
     xlab = "",
     col = "black")
# add points from 2nd variable
points(filt$DateTime,
       filt$Sub_metering_2, 
       type = "l",
       ylab = "Energy sub metering",
       xlab = "",
       col = "red")
# add points from 3rd variable
points(filt$DateTime,
       filt$Sub_metering_3, 
       type = "l",
       ylab = "Energy sub metering",
       xlab = "",
       col = "blue")
# add legend
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  # labels
       lty = c(1, 1, 1),                                                  # line type
       lwd = c(2.0, 2.0, 2.0),                                            # line width
       col = c("black", "red", "blue")                                    # line color
)
# 4: Global Rective Power usage versus time
plot(filt$DateTime,
     filt$Global_reactive_power, 
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")
# open png device and set width, height and units explicitly
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow= c(2,2))
# make the plots
# 1st plot
with(filt,
     plot(
         DateTime,
         Global_active_power, 
         type = "l",
         ylab = "Global Active Power",
         xlab = ""))
# 2nd plot
with(filt,
     plot(
         DateTime,
         Voltage, 
         type = "l",
         ylab = "Voltage",
         xlab = "datetime"))
# 3rd plot
with(filt, 
     plot(DateTime,
          Sub_metering_1, 
          type = "l",
          ylab = "Energy sub metering",
          xlab = "",
          col = "black"))
with(filt,
     points(filt$DateTime,
            filt$Sub_metering_2, 
            type = "l",
            ylab = "Energy sub metering",
            xlab = "",
            col = "red"))
with(filt,
     points(filt$DateTime,
            filt$Sub_metering_3, 
            type = "l",
            ylab = "Energy sub metering",
            xlab = "",
            col = "blue"))
with(filt,                            # add legend
     legend("topright",
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  # labels
            lty = c(1, 1, 1),                                                  # line type
            lwd = c(2.0, 2.0, 2.0),                                            # line width
            col = c("black", "red", "blue")                                    # line color
     ))
# 4th plot
with(filt,
     plot(DateTime,
         Global_reactive_power, 
         type = "l",
         ylab = "Global_reactive_power",
         xlab = "datetime"))
# close the png device
dev.off()