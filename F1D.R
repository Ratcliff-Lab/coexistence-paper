# Plot the aspect ratio for small, big and large
library(extrafont)
library(readxl)

setwd("/Users/rpineau3/Desktop/NEEscripts") # Set directory here
mydata <- read_excel("data_used_to_generate_figs_in_coexistence_paper.xlsx", 
                     sheet = "Fig1D")

setwd("F1")

anc <- as.numeric(as.matrix(mydata[-c(1),1]))
summary(anc)
large <- as.numeric(as.matrix(mydata[-c(1),2]))
summary(large)
small <- as.numeric(as.matrix(mydata[-c(1),3]))
summary(small)

# Calculate mean and sd
data <- cbind(anc, large, small)
means <- apply(data, 2, mean, na.rm=T)
means_sorted <- means[c(1,3,2)]
std <- apply(data, 2, sd, na.rm=T)
std_sorted <- std[c(1,3,2)]

#######################################
# Plot
#######################################

pdf(file="aspect_ratio.pdf", bg = "transparent",
    width=6, height=6, family = "Times New Roman")

#######################################

par(family="Times New Roman", cex.lab=1.9, cex.axis=2, cex.main=1.5, cex.sub=1.5)#, col.lab="white", col.axis = "white")

plot(means_sorted, pch=16, cex=3, xlim = c(0.8,3.2), ylim = c(0.5,3),bty="n",
     xlab="", ylab="Cellular aspect ratio", xaxt="n", col=c("gray","#d8b365", "#5ab4ac"))
grid()
points(means_sorted, pch=16, cex=3, col=c("gray","#d8b365", "#5ab4ac"))
arrows(c(1,2,3), means_sorted-std_sorted, c(1,2,3), means_sorted+std_sorted, 
       length = 0.1, angle = 90, code = 3, lty = par("lty"),
       lwd = par("lwd"), col=c( "gray","#d8b365","#5ab4ac"))

axis(side=1, at=c(0,1,2,3,4), labels = c("","Ancestor", "Small", "Large",""), tick = F, pos = 0.5)

#######################################


dev.off()



