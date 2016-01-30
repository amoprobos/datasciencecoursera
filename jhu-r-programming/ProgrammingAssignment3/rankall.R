#!/usr/bin/env Rscript

source("common.R")
source("rankhospital.R")

rankall <- function(outcome, num = "best") {
	
	# Read outcome data
	outcome.data <- read.csv("outcome-of-care-measures.csv", 
	                         colClasses="character")

	# Check that outcome is valid
	if (! (outcome %in% OUTCOMES)) {
		stop("invalid outcome")
	}
	
	if (outcome == "pneumonia") {
		outcome.col <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
	} else if (outcome == "heart attack") {
		outcome.col <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
	} else if (outcome == "heart failure") {
		outcome.col <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
	}
	
	# TODO: vectorise this
	state.rankings <- data.frame(cbind(NA, STATES), stringsAsFactors=F)
	rownames(state.rankings) <- STATES
	colnames(state.rankings) <- c("hospital", "state")
	for (state in STATES) {
		state.data <- outcome.data[outcome.data$State == state, ]
		state.rankings[state, 1] <- calculate.rank(state.data, outcome.col, num)
	}
	return(state.rankings)
}
