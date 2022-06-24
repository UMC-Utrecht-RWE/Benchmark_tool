#Author: VAZ, TA
#tandresv@umcutrecht.nl
#University Medical Center Utrecht
#10/6/2022
#CoVE - time performance benchmarking

#start
rm(list=ls())

#settings
projectFolder<-dirname(rstudioapi::getSourceEditorContext()$path)
setwd(projectFolder)
source("./packages.R")

#benchmarking: start clock
start_time <- Sys.time()

#mockup function to verify if result from different processes are identical
check_equal <- function(values) {
  val1 <- 1
  val2 <- 1
  val2 == val1
}
pre_dir <- paste0(projectFolder,"/source/p_steps/")
#execute different implementations for the same problem 100x each
mbm <- microbenchmark( "a" = { a <- 1+2 },
                       "b" = { b <- 1+1+1 },
                       # "c" = { c <- source(paste0(pre_dir, "/function_1.R")) },
                       check = check_equal,
                       times = 100
)

#print results
library(ggplot2)
mbm
autoplot(mbm)
end_time <- Sys.time()
end_time - start_time


