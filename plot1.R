# plot1.R
# plot a histogram of frequency of Global Active Power usage in kilowatts
#
# Code for getting and filtering data is in a separate function,
# in a file getFilteredData.R, in the same directory as this file.
#
# load the function
source("getFilteredData.R")

# get the filtered data, and make the plot
filt <- getFilteredData()
# create plot on screen device
hist(filt$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     col = "red")
# open png device and set width, height and units explicitly
png(filename = "plot1.png", width = 480, height = 480, units = "px")
# make the plot
with(filt, 
     hist(Global_active_power,
          main = "Global Active Power",
          xlab = "Global Active Power (kilowatts)", 
          col = "red")
)
# close the png device
dev.off()