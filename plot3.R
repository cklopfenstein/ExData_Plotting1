# plot3.R
# Plot values of submetered power use vs time over a 2-day period
#
# Code for getting and filtering data is in a separate function,
# in a file getFilteredData.R, in the same directory as this file.
#
# load the function
source("getFilteredData.R")

# get the filtered data, and make the plot
filt <- getFilteredData()

# open png device and set width, height and units explicitly
png(filename = "plot3.png", width = 480, height = 480, units = "px")
# make the plot
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
with(filt,
     # add legend
     legend("topright",
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  # labels
            lty = c(1, 1, 1),                                                  # line type
            lwd = c(1.0, 1.0, 1.0),                                            # line width
            col = c("black", "red", "blue"),                                   # line color
            bty = "n"                                                          # box around legend off
     )
)
# close the png device
dev.off()