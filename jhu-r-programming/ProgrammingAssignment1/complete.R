#!/usr/bin/env Rscript

complete <- function(directory, id = 1:332) {
	
	output.data <- data.frame(matrix(NA, nrow=0, ncol=2))

	# subset file listing here, assuming that files are named by ID
	for (f in list.files(directory)[id]) {
		dframe <- read.csv(sprintf("%s/%s", directory, f))
		
		for (id in unique(dframe$ID)) {
			num.complete <- nrow(dframe[!is.na(dframe$sulfate) & 
			                            !is.na(dframe$nitrate), ])
			output.data <- rbind(output.data, c(id, num.complete))
		}
	}
	colnames(output.data) <- c("id", "nobs")
	return(output.data)
}
