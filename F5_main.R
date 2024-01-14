# Main

# Analyze output of evolution experiment on monocultures of Bigs and Smalls
setwd("/Users/rpineau3/Desktop/NEEscripts/F5")
rm(list = ls())

#----- Libraries
library(extrafont)


#----- Upload data 
source("Figure5_load-data.R") # All lines from day 0 to day 40

#--------------------------------


#-----  Biomass weighted distributions and analyses
setwd("/Users/rpineau3/Desktop/NEEscripts/F5")
source("Figure5_normalize-by-biomass.R") # All lines from day 0 to day 40

#--------------------------------

#-----  Figure
setwd("/Users/rpineau3/Desktop/NEEscripts/F5")
source("Figure5_plot_mean_versus_time_biomass_transformed.R") # One plot with mean of biomass transformed distribution as a function of time


################################

