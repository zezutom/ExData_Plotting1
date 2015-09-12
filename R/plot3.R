plot3 <- function(data, width = 504, height = 504) {
  # see Saving Plots in R: http://www.stat.berkeley.edu/~s133/saving.html
  png("plot3.png", width = width, height = height)
  
  # Draw the plot
  plot(data$Time, data$Sub_metering_1,
       type = "l",
       xlab = "",
       ylab = "Energy sub metering",
       col = "black")
  
  # Add custom colours to the selected segments
  lines(data$Time, data$Sub_metering_2, col = "red")
  lines(data$Time, data$Sub_metering_3, col = "blue")
  
  # Add a legend, 'lty' makes it use a line as opposed to a circle
  legend("topright",
         col = c("black", "red", "blue"),
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = 1)
  
  dev.off()
}