plot2 <- function(data, width = 504, height = 504) {
  # see Saving Plots in R: http://www.stat.berkeley.edu/~s133/saving.html
  png("plot2.png", width = width, height = height)
  
  plot(data$Time, data$Global_active_power,
       type="l",
       xlab = "",
       ylab="Global Active Power (kilowatts)")

  dev.off()
}