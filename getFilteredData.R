#getFilteredData.R
getFilteredData = function() {
    # for local use
    setwd("~/Devel/R/DataScience/EDA/Project1/ExData_Plotting1")
    # libraries
    library("data.table")
    library("dplyr")
    library("lubridate")
    # constants
    zipFile <- "./uci.zip"
    rawFile <- "./household_power_consumption.txt"
    outFile <- "./filteredData.csv"
    startDate <- ymd("2007-02-01")
    endDate <- ymd("2007-02-03")
    #
    # check if the filtered data file already exists, if so, just read in data (see below)
    filtExists <- file.exists(outFile)
    #
    if (!filtExists) {
        # check if raw data file exists
        rawExists <- file.exists(rawFile)
        if (!rawExists) {
            # assume that if the raw data file is not present, we haven't downloaded
            # the zip file either. So do the download and unzip here
            download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                          destfile = zipFile, method = "wget")
            unzip(zipFile, exdir = "./")
        }
        # read in the data
        dt <- read.table(rawFile, header = TRUE, stringsAsFactors = FALSE, sep = ";",
                         colClasses = c(rep("character", 2), rep("numeric", 7)),
                         na.strings = "?")
        # Filter the data by date range. Use lubridate package to convert date and time character values
        # to POSIX Date objects. Use dplyr package to filter the data table.
        dates <- dmy_hms(paste(dt[,1], dt[,2]))
        dt[, "DateTime"] <- dates
        timeSpan <- interval(startDate, endDate - 1)
        dt <- filter(dt, (DateTime %within% timeSpan))
        # strip off original date and time columns, keep POSIXct DateTime as last column, write
        # selected date range to file.
        # note: had to change separator from " " to "," in order to read a string containing a space
        # as POSIXct
        write.table(dt[c(-1, -2)], file = outFile, row.names = FALSE, sep = ",")
        # test read
        #filt <- read.table(outFile,
        #                   header = TRUE, stringsAsFactors = FALSE, sep = ",",
        #                   colClasses = c(rep("numeric", 7), "POSIXct"))
    }
    # read filtered data and return a data table
    filt <- read.table(outFile,
                       header = TRUE, stringsAsFactors = FALSE, sep = ",",
                    colClasses = c(rep("numeric", 7), "POSIXct"))
}