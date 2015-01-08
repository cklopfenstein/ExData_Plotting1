# plot4.R
# Plot values of Global active power use, voltage, submetered power use 
# and Global reactive power use vs time over a 2-day period
#
# for local use
setwd("~/Devel/R/DataScience/EDA/Project1/ExData_Plotting1")
# check if raw data file exists
rawExists <- file.exists("./household_power_consumption.txt")
if (!rawExists) {
    # assume that if the raw data file is not present, we haven't downloaded
    # the zip file either. So do the download and unzip here
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                  destfile = "./uci.zip", method = "wget")
    unzip("./uci.zip", exdir = "./")
}
# read in the data
library("data.table")
dt <- read.table("./household_power_consumption.txt", 
                 header = TRUE, stringsAsFactors = FALSE, sep = ";",
                 colClasses = c(rep("character", 2), rep("numeric", 7)),
                 na.strings = "?")
# Filter the data by date range. Use lubridate package to convert date and time character values
# to Posix Date objects. Use dplyr package to filter the data table.
library("dplyr")
library("lubridate")
dates <- dmy_hms(paste(dt[,1], dt[,2]))
dt[, "DateTime"] <- dates
startDate <- ymd("2007-02-01")
endDate <- ymd("2007-02-03")
timeSpan <- interval(startDate, endDate - 1)
dt <- filter(dt, (DateTime %within% timeSpan))
#
# we now have the filtered data, so make the plots
