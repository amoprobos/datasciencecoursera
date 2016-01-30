#!/usr/bin/env Rscript

source("common.R")

# general function to calculate rank over this data
calculate.rank <- function(outcome.data, outcome.col, num = "best") {
	# if we have no data in this (sub)set
	if (nrow(outcome.data) == 0) {
		return(NA)
	}

	outcomes <- suppressWarnings(as.numeric(outcome.data[, outcome.col]))
	sorted.data <- outcome.data[order(outcomes, outcome.data$Hospital.Name, na.last=NA), ]
		
	if (num == "best") {
		rank <- 1
	} else if (num == "worst") {
		rank <- nrow(sorted.data)
	} else if (num > nrow(sorted.data)) {
		return(NA)
	} else {
		rank <- num
	}
	return(sorted.data[rank, "Hospital.Name"])
}

rankhospital <- function(state, outcome, num = "best") {

	# Read outcome data
	outcome.data <- read.csv("outcome-of-care-measures.csv", 
	                         colClasses="character")

	# Check that state and outcome are valid
	if (! (state %in% STATES)) {
		stop("invalid state")
	}
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

	# Return hospital name in that state with lowest 30-day death rate
	state.data <- outcome.data[outcome.data$State == state, ]
	
	return(calculate.rank(state.data, outcome.col, num))
}
