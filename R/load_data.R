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
  df <- read.table(
          source_txt, 
          header = TRUE,
          sep = ";",
          na.strings = c("?"))
  
  # Convert the Date and Time variables to Date/Time classes
  df$Time <- strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  df$Date <- as.Date(df$Date, "%d/%m/%Y")
  
  # We will only be using data from the dates 2007-02-01 and 2007-02-02
  date_range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  df <- subset(df, Date %in% date_range)
  
  return (df)
}





