plot1 <- function(data, width = 480, height = 480) {
  # see Saving Plots in R: http://www.stat.berkeley.edu/~s133/saving.html
  png("plot1.png", width = width, height = height)
  
  hist(data$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
  
  dev.off()
}