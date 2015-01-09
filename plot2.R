# plot2.R
# plot Global Active Power usage in kilowatts versus time for the
# specified period.
#
# Code for getting and filtering data is in a separate function,
# in a file getFilteredData.R, in the same directory as this file.
#
# load the function
source("getFilteredData.R")

# get the filtered data, and make the plot
filt <- getFilteredData()
# create plot on screen device
#plot(filt$DateTime,
#     filt$Global_active_power, 
#     type = "l",
#     ylab = "Global Active Power (kilowatts)",
#     xlab = "",
#     bg = "transparent")
# open png device and set width, height and units explicitly
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
# make the plot
with(filt, 
     plot(DateTime,
          Global_active_power, 
          type = "l",
          ylab = "Global Active Power (kilowatts)",
          xlab = "")
)
# close the png device
dev.off()