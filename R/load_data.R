####
# Loads the dataset: Electric power consumption [20Mb]
####

load_dataset <- function() {
  source_txt <- "household_power_consumption.txt"
  
  # Download the archive if needed
  if (!file.exists(source_txt)) {
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    source_zip <- "source.zip"
    download.file(url, destfile = source_zip, method = "curl")
    unzip(source_zip, files = source_txt)
    unlink(source_zip)
  }
  
  # Load the content into a data frame
  #
  # This is to make it as efficient as possible, assuming we are okay with using 'read.table'
  # see Reading large tables into R: 
  # http://www.biostat.jhsph.edu/~rpeng/docs/R-large-tables.html
  #
  # Alternatively, we could make use of 'fread' or 'sqldf'
  #
  # I couldn't find a way of how to apply a filter while reading the data. 
  # Open to suggestions (yeah, I know about sqldf, but would prefer something more straightforward).

  # Optimization #1: Determine column classes using a small dataset
  tab5rows <- read.table(source_txt, header = TRUE, nrows = 5,  sep = ";", na.strings = c("?"))
  classes <- sapply(tab5rows, class)
  
  # Optimization #2: Specify the total number of rows, if you happen to know them
  rowcount <- 2075259
  
  # Now, read the whole table
  tabAll <- read.table(
          source_txt, 
          header = TRUE,
          colClasses = classes,
          nrows = rowcount,
          sep = ";",
          na.strings = c("?"))
  
  # Convert the Date and Time variables to Date/Time classes
  tabAll$Date <- as.Date(tabAll$Date, "%d/%m/%Y")
  tabAll$Time <- strptime(tabAll$Time, "%H:%M:%S")
  
  # We will only be using data from the dates 2007-02-01 and 2007-02-02
  date_range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  tabAll <- subset(tabAll, Date %in% date_range)
  
  return (tabAll)
}





