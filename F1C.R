# Plot the size distributions for ancestor, small and large
library(extrafont)
library(readxl)

#######################################
# Gather data
#######################################

setwd("/Users/rpineau3/Desktop/NEEscripts/") # Set directory here
mydata <- read_excel("data_used_to_generate_figs_in_coexistence_paper.xlsx", 
           sheet = "Fig1C")

setwd("F1")

ancestor_radius <- as.numeric(as.matrix(mydata[-c(1,2),1]))
anc_mean <- mean(ancestor_radius, na.rm = T)
sd(ancestor_radius, na.rm = T)

small_radius <- as.numeric(as.matrix(mydata[-c(1,2),3]))
small_mean <- mean(small_radius, na.rm = T)
sd(small_radius, na.rm = T)

large_radius <-  as.numeric(as.matrix(mydata[-c(1,2),2]))
large_mean <- mean(large_radius, na.rm = T)
sd(large_radius, na.rm = T)

#######################################
# size distribution
#######################################
# Save figure 
pdf(file="size_distribution_biomass_raw.pdf", bg = "transparent",
    width=6, height=6, family = "Arial")

max_val <- 0.3 # Adjust relative contribution to optimize visualization

par(oma=c(1,1,1,1))
par(family="Arial", cex.lab=1.8, cex.axis=1.8, cex.main=1.8, cex.sub=1.8)#, col.lab="white", col.axis = "white")

# Small size distribution and mean
sm <- density(small_radius)
factor <- max_val/max(sm$y)
plot(sm$x, sm$y*factor, type="l", lty = 2, lwd=4, col="#d8b365", xlim=c(0,150),ylim = c(0,0.35),
     xlab=expression(paste("Multicellular size (radius in ", mu, "m)")), ylab="Proportion", bty="n")  # first histogram
#lines(rep(small_mean,2), c(0,0.3), type="l", lty=2, lwd =1.8, col="#d8b365", xlim=c(0,200)) 


# Ancestor size distribution and mean
ac <- density(ancestor_radius,  na.rm = T)
lines(ac$x, ac$y*factor, type="l", lwd =4, col="gray", xlim=c(0,200))  
#lines(rep(anc_mean,2), c(0,0.35), type="l", lty=2, lwd =1.8, col="gray", xlim=c(0,200)) 

# Large size distribution and mean
lg <- density(large_radius,  na.rm = T)
lines(lg$x, lg$y*factor*5, type="l",lty=4, lwd =4, col="#5ab4ac", xlim=c(0,200)) 
#lines(rep(large_mean,2), c(0,0.20), type="l", lty=2, lwd =1.8, col="#5ab4ac", xlim=c(0,200)) 

legend("topright", c("Ancestor","Small isolate","Large isolate"), lwd=4, cex = 8,
       col=c("gray","#d8b365","#5ab4ac"), 
       lty = c(1,2,4),
       bty="n")

dev.off()
embed_fonts("size_distribution_biomass_raw.pdf")
