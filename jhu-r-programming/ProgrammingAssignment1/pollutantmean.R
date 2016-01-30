#!/usr/bin/env Rscript

pollutantmean <- function(directory, pollutant, id = 1:332) {
	
	all.data <- data.frame(matrix(NA, nrow=0, ncol=4))
	colnames(all.data) <- c("Date", "sulfate", "nitrate", "ID")

	# subset file listing here, assuming that files are named by ID
	for (f in list.files(directory)[id]) {
		dframe <- read.csv(sprintf("%s/%s", directory, f))
		all.data <- rbind(all.data, dframe)
	}
	#print(all.data)
	
	pollutant.data <- all.data[all.data$ID %in% id, pollutant]
	#print(pollutant.data)
	return(mean(pollutant.data, na.rm=T))
}
