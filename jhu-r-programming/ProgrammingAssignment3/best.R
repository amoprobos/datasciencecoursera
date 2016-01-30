#!/usr/bin/env Rscript

source("common.R")
source("rankhospital.R")

best <- function(state, outcome) {
	return(rankhospital(state, outcome, num="best"))
}
