#!/usr/bin/env Rscript

corr <- function(directory, threshold = 0) {
	
	correlations <- vector(mode="numeric")

	# subset file listing here, assuming that files are named by ID
	for (f in list.files(directory)) {
		dframe <- read.csv(sprintf("%s/%s", directory, f))
		
		for (id in unique(dframe$ID)) {
			complete <- dframe[!is.na(dframe$sulfate) & 
			                   !is.na(dframe$nitrate), ]
			num.complete <- nrow(complete)
			if (num.complete > threshold) {
				correlations <- c(correlations, 
				                  cor(complete$sulfate, complete$nitrate))
			}
		}
	}
	return(correlations)
}
