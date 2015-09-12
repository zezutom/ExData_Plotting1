####
# Runs all the scripts generating the plots.
#
# Output: plot1 - plot4 PNG in the working directory
####

# Helper method: loads scripts from the R directory
source_r <- function(...) {
  scripts <- c(...)
  lapply(scripts, function(script) {
    source(file.path(paste(script, "R", sep = ".")))
  })
}

# Load the scripts
source_r("load_data", "plot1", "plot2", "plot3", "plot4")

# Generate the plots
make_plots <- function() {
  # Load data
  df <- load_dataset()
  
  # Generate the plots as PNGs in the working directory
  plot1(df)
  plot2(df)
  plot3(df)
  plot4(df)
}