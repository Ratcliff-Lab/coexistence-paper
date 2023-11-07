# Main

# Analyze output of evolution experiment on monocultures of Bigs and Smalls
setwd("/Users/rpineau3/Dropbox (GaTech)/BioSci-Ratcliff/Rozenn/2.CoexistenceProject/12-Writing/8-scripts/2-second-round-revisions/pre-revision/Figure5")
rm(list = ls())

#----- Libraries
library(extrafont)


#----- Upload data 
source("Figure5_load-data.R") # All lines from day 0 to day 40

#--------------------------------


#-----  Biomass weighted distributions and analyses
source("Figure5_normalize-by-biomass.R") # All lines from day 0 to day 40

#--------------------------------

#-----  Figure
source("Figure5_plot_mean_versus_time_biomass_transformed.R") # One plot with mean of biomass transformed distribution as a function of time


################################

