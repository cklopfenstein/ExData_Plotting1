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

# create plots on png device, 2 rows of 2 columns
# open png device and set width, height and units explicitly
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
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
with(filt,                                 # 1st plot
     plot(DateTime,
          Sub_metering_1, 
          type = "l",
          ylab = "Energy sub metering",
          xlab = "",
          col = "black"))
with(filt,                                 # add points for 2nd plot
     points(filt$DateTime,
            filt$Sub_metering_2, 
            type = "l",
            ylab = "Energy sub metering",
            xlab = "",
            col = "red"))
with(filt,                                 # add points for 3rd plot
     points(filt$DateTime,
            filt$Sub_metering_3, 
            type = "l",
            ylab = "Energy sub metering",
            xlab = "",
            col = "blue"))
with(filt,                                 # add legend
     legend("topright",
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  # labels
            lty = c(1, 1, 1),                                                  # line type
            lwd = c(1.0, 1.0, 1.0),                                            # line width
            col = c("black", "red", "blue"),                                   # line color
            bty = "n"                                                          # no box
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