#This script uses a data.frame from the script "10._Calculate_MCBM_Edge".
#Therefore, to run this script "10._Calculate_MCBM_Edge" needs to be ran first

#VK1_2007__StLaurent_1 contains only one km_to_nearest_edge_of_habitat and will not be included
EdgePlotDI1_2011__Neuschulz_1   <- filter(CMBMEdge, Source_ID_Study_number == "DI1_2011__Neuschulz_1")
EdgePlotDL1_2009__Woinarski_1   <- filter(CMBMEdge, Source_ID_Study_number == "DL1_2009__Woinarski_1")
EdgePlotDL1_2010__Proenca_2     <- filter(CMBMEdge, Source_ID_Study_number == "DL1_2010__Proenca_2")
EdgePlotDL1_2011__Mallari_1     <- filter(CMBMEdge, Source_ID_Study_number == "DL1_2011__Mallari_1")
EdgePlotDL1_2011__MorenoMateos_1<- filter(CMBMEdge, Source_ID_Study_number == "DL1_2011__MorenoMateos_1")
EdgePlotDL1_2012__Dallimer_1    <- filter(CMBMEdge, Source_ID_Study_number == "DL1_2012__Dallimer_1") #empty because its not there!
EdgePlotDL1_2013__Bartolommei_1 <- filter(CMBMEdge, Source_ID_Study_number == "DL1_2013__Bartolommei_1")

#Calculate Kendalls tau
Kendall(EdgePlotDI1_2011__Neuschulz_1$ Km_to_nearest_edge_of_habitat, EdgePlotDI1_2011__Neuschulz_1$CMWBS)
Kendall(EdgePlotDL1_2009__Woinarski_1$ Km_to_nearest_edge_of_habitat, EdgePlotDL1_2009__Woinarski_1$CMWBS) 
Kendall(EdgePlotDL1_2010__Proenca_2$ Km_to_nearest_edge_of_habitat, EdgePlotDL1_2010__Proenca_2$CMWBS) 
Kendall(EdgePlotDL1_2011__Mallari_1$ Km_to_nearest_edge_of_habitat,EdgePlotDL1_2011__Mallari_1$CMWBS) 
Kendall(EdgePlotDL1_2011__MorenoMateos_1$ Km_to_nearest_edge_of_habitat, EdgePlotDL1_2011__MorenoMateos_1$CMWBS) 
Kendall(EdgePlotDL1_2012__Dallimer_1$ Km_to_nearest_edge_of_habitat, EdgePlotDL1_2012__Dallimer_1$CMWBS) 
Kendall(EdgePlotDL1_2013__Bartolommei_1$ Km_to_nearest_edge_of_habitat, EdgePlotDL1_2013__Bartolommei_1$CMWBS) 

##Exporting the plots in the same size. Plot window width till here####----->
plot(EdgePlotDI1_2011__Neuschulz_1$Km_to_nearest_edge_of_habitat, EdgePlotDI1_2011__Neuschulz_1$CMWB, ylab = "Weighted mean community body mass (g)", xlab = "DEHHB (km)", main ="Neuschulz" , xlim=c(-0.6, 0.25))
text(0.2, 22, labels = "tau = 0.048")
text(0.14, 12, labels = "2-sided pvalue =0.776 ") 

plot(EdgePlotDL1_2009__Woinarski_1$Km_to_nearest_edge_of_habitat,EdgePlotDL1_2009__Woinarski_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "DEHHB (km)", main ="Woinarski", xlim=c(-1.3, 7.5))
text(7, 85, labels = "tau = 0.106") 
text(6.4, 18, labels = "2-sided pvalue =0.079") 

plot(EdgePlotDL1_2010__Proenca_2$Km_to_nearest_edge_of_habitat, EdgePlotDL1_2010__Proenca_2$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "DEHHB (km)", main ="Proenca", xlim=c(-1.3, 7.5))
text(6.85, 17, labels = "tau = 0.264")
text(6.2, 12, labels = "2-sided pvalue =0.071") 

plot(EdgePlotDL1_2011__Mallari_1$Km_to_nearest_edge_of_habitat, EdgePlotDL1_2011__Mallari_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "DEHHB (km)", main ="Mallari", xlim=c(0, 5.9))   
text(5.5, 50, labels = "tau = -0.037")
text(5.1, 20, labels = "2-sided pvalue =0.719") 

plot(EdgePlotDL1_2011__MorenoMateos_1$Km_to_nearest_edge_of_habitat, EdgePlotDL1_2011__MorenoMateos_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "DEHHB (km)", main ="MorenoMateos", xlim=c(28, 57))
text(55, 180, labels = "tau = -0.265")
text(53, 115, labels = "2-sided pvalue =0.195")

plot(EdgePlotDL1_2012__Dallimer_1$Km_to_nearest_edge_of_habitat, EdgePlotDL1_2012__Dallimer_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "DEHHB (km)", main ="Dallimer", xlim=c(-2, 10)) 
text(9.3, 23.5, labels = "tau = -0.338")
text(8.4, 18, labels = " 2-sided pvalue =0.126 ") 

plot(EdgePlotDL1_2013__Bartolommei_1$Km_to_nearest_edge_of_habitat, EdgePlotDL1_2013__Bartolommei_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "DEHHB (km)", main ="Bartolommei")  
text(14.7, 125, labels = "tau = 0.26")
text(13.8, 110, labels = "2-sided pvalue =0.271")  

#CALC WITH NO SITES REMOVED
#No. of sites per study
n_distinct(EdgePlotDI1_2011__Neuschulz_1)
n_distinct(EdgePlotDL1_2009__Woinarski_1)
n_distinct(EdgePlotDL1_2010__Proenca_2)
n_distinct(EdgePlotDL1_2011__Mallari_1)
n_distinct(EdgePlotDL1_2011__MorenoMateos_1)
n_distinct(EdgePlotDL1_2012__Dallimer_1)
n_distinct(EdgePlotDL1_2013__Bartolommei_1)

#mean WMCBM
mean(EdgePlotDI1_2011__Neuschulz_1$CMWBS)
mean(EdgePlotDL1_2009__Woinarski_1$CMWBS)
mean(EdgePlotDL1_2010__Proenca_2$CMWBS)
mean(EdgePlotDL1_2011__Mallari_1$CMWBS)
mean(EdgePlotDL1_2011__MorenoMateos_1$CMWBS)
mean(EdgePlotDL1_2012__Dallimer_1$CMWBS)
mean(EdgePlotDL1_2013__Bartolommei_1$CMWBS)

#sd WMCBM
sd(EdgePlotDI1_2011__Neuschulz_1$CMWBS)
sd(EdgePlotDL1_2009__Woinarski_1$CMWBS)
sd(EdgePlotDL1_2010__Proenca_2$CMWBS)
sd(EdgePlotDL1_2011__Mallari_1$CMWBS)
sd(EdgePlotDL1_2011__MorenoMateos_1$CMWBS)
sd(EdgePlotDL1_2012__Dallimer_1$CMWBS)
sd(EdgePlotDL1_2013__Bartolommei_1$CMWBS)

#mean Distance to edge
mean(EdgePlotDI1_2011__Neuschulz_1$Km_to_nearest_edge_of_habitat)
mean(EdgePlotDL1_2009__Woinarski_1$Km_to_nearest_edge_of_habitat)
mean(EdgePlotDL1_2010__Proenca_2$Km_to_nearest_edge_of_habitat)
mean(EdgePlotDL1_2011__Mallari_1$Km_to_nearest_edge_of_habitat)
mean(EdgePlotDL1_2011__MorenoMateos_1$Km_to_nearest_edge_of_habitat)
mean(EdgePlotDL1_2012__Dallimer_1$Km_to_nearest_edge_of_habitat)
mean(EdgePlotDL1_2013__Bartolommei_1$Km_to_nearest_edge_of_habitat)

#sd Distance to edge
sd(EdgePlotDI1_2011__Neuschulz_1$Km_to_nearest_edge_of_habitat)
sd(EdgePlotDL1_2009__Woinarski_1$Km_to_nearest_edge_of_habitat)
sd(EdgePlotDL1_2010__Proenca_2$Km_to_nearest_edge_of_habitat)
sd(EdgePlotDL1_2011__Mallari_1$Km_to_nearest_edge_of_habitat)
sd(EdgePlotDL1_2011__MorenoMateos_1$Km_to_nearest_edge_of_habitat)
sd(EdgePlotDL1_2012__Dallimer_1$Km_to_nearest_edge_of_habitat)
sd(EdgePlotDL1_2013__Bartolommei_1$Km_to_nearest_edge_of_habitat)

##########################################################################################
#From here follows the analysis of why no linear relation was present within the studies.#
##########################################################################################

#fitting linear model
lm.EdgePlotDI1_2011__Neuschulz_1 <-  lm(CMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgePlotDI1_2011__Neuschulz_1 )   # -
lm.EdgePlotDL1_2009__Woinarski_1<- lm(CMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgePlotDL1_2009__Woinarski_1 )   # +
lm.EdgePlotDL1_2010__Proenca_2<- lm(CMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgePlotDL1_2010__Proenca_2 )     # +
lm.EdgePlotDL1_2011__Mallari_1<- lm(CMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgePlotDL1_2011__Mallari_1)      # -
lm.EdgePlotDL1_2011__MorenoMateos_1<- lm(CMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgePlotDL1_2011__MorenoMateos_1) # -
lm.EdgePlotDL1_2012__Dallimer_1<- lm(CMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgePlotDL1_2012__Dallimer_1)     # -
lm.EdgePlotDL1_2013__Bartolommei_1 <- lm(CMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgePlotDL1_2013__Bartolommei_1)  # -

#Plot normal with linear model 
par(mfrow = c(2,4),
    oma = c(5,4,0,0) + 0.1,
    mar = c(4,4,1,1) + 0.1)
plot(EdgePlotDI1_2011__Neuschulz_1$Km_to_nearest_edge_of_habitat, EdgePlotDI1_2011__Neuschulz_1$CMWB, ylab = "CWMBM", xlab = "Km_to_edge")
abline(lm.EdgePlotDI1_2011__Neuschulz_1)
plot(EdgePlotDL1_2009__Woinarski_1$Km_to_nearest_edge_of_habitat,EdgePlotDL1_2009__Woinarski_1$CMWBS, ylab = "CWMBM", xlab = "Km_to_edge")
abline(lm.EdgePlotDL1_2009__Woinarski_1)
plot(EdgePlotDL1_2010__Proenca_2$Km_to_nearest_edge_of_habitat, EdgePlotDL1_2010__Proenca_2$CMWBS, ylab = "CWMBM", xlab = "Km_to_edge")
abline(lm.EdgePlotDL1_2010__Proenca_2)
plot(EdgePlotDL1_2011__Mallari_1$Km_to_nearest_edge_of_habitat, EdgePlotDL1_2011__Mallari_1$CMWBS, ylab = "CWMBM", xlab = "Km_to_edge")   
abline(lm.EdgePlotDL1_2011__Mallari_1)
plot(EdgePlotDL1_2011__MorenoMateos_1$Km_to_nearest_edge_of_habitat, EdgePlotDL1_2011__MorenoMateos_1$CMWBS, ylab = "CWMBM", xlab = "Km_to_edge")
abline(lm.EdgePlotDL1_2011__MorenoMateos_1)
plot(EdgePlotDL1_2013__Bartolommei_1$Km_to_nearest_edge_of_habitat, EdgePlotDL1_2013__Bartolommei_1$CMWBS, ylab = "CWMBM", xlab = "Km_to_edge")  
abline(lm.EdgePlotDL1_2013__Bartolommei_1)

#possible a linear relation
plot(EdgePlotDL1_2012__Dallimer_1$Km_to_nearest_edge_of_habitat, EdgePlotDL1_2012__Dallimer_1$CMWBS, ylab = "CWMBM", xlab = "Km_to_edge") #not here yet
abline(lm.EdgePlotDL1_2012__Dallimer_1)

#Plot log 
EdgeLogPlotDI1_2011__Neuschulz_1   <- filter(LogCMBMEdge, Source_ID_Study_number == "DI1_2011__Neuschulz_1")
EdgeLogPlotDL1_2009__Woinarski_1   <- filter(LogCMBMEdge, Source_ID_Study_number == "DL1_2009__Woinarski_1")
EdgeLogPlotDL1_2010__Proenca_2     <- filter(LogCMBMEdge, Source_ID_Study_number == "DL1_2010__Proenca_2")
EdgeLogPlotDL1_2011__Mallari_1     <- filter(LogCMBMEdge, Source_ID_Study_number == "DL1_2011__Mallari_1")
EdgeLogPlotDL1_2011__MorenoMateos_1<- filter(LogCMBMEdge, Source_ID_Study_number == "DL1_2011__MorenoMateos_1")
EdgeLogPlotDL1_2012__Dallimer_1    <- filter(LogCMBMEdge, Source_ID_Study_number == "DL1_2012__Dallimer_1") #empty because its not there!
EdgeLogPlotDL1_2013__Bartolommei_1 <- filter(LogCMBMEdge, Source_ID_Study_number == "DL1_2013__Bartolommei_1")

par(mfrow = c(2,5),
    oma = c(5,4,0,0) + 0.1,
    mar = c(4,4,1,1) + 0.1)
plot(((EdgeLogPlotDI1_2011__Neuschulz_1 $Km_to_nearest_edge_of_habitat)), EdgeLogPlotDI1_2011__Neuschulz_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")
abline(lm.EdgeLogPlotDI1_2011__Neuschulz_1)

plot((EdgeLogPlotDL1_2009__Woinarski_1$Km_to_nearest_edge_of_habitat),EdgeLogPlotDL1_2009__Woinarski_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")
abline(lm.EdgeLogPlotDL1_2009__Woinarski_1)

plot((EdgeLogPlotDL1_2010__Proenca_2$Km_to_nearest_edge_of_habitat), EdgeLogPlotDL1_2010__Proenca_2$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")
abline(lm.EdgeLogPlotDL1_2010__Proenca_2)
 
plot((EdgeLogPlotDL1_2011__Mallari_1$Km_to_nearest_edge_of_habitat), EdgeLogPlotDL1_2011__Mallari_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")   
abline(lm.EdgeLogPlotDL1_2011__Mallari_1)
  
plot((EdgeLogPlotDL1_2011__MorenoMateos_1$Km_to_nearest_edge_of_habitat), EdgeLogPlotDL1_2011__MorenoMateos_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")
abline(lm.EdgeLogPlotDL1_2011__MorenoMateos_1)

plot((EdgeLogPlotDL1_2012__Dallimer_1$Km_to_nearest_edge_of_habitat), EdgeLogPlotDL1_2012__Dallimer_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge") 
abline(lm.EdgeLogPlotDL1_2012__Dallimer_1)

plot((EdgeLogPlotDL1_2013__Bartolommei_1$Km_to_nearest_edge_of_habitat), EdgeLogPlotDL1_2013__Bartolommei_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")  
abline(lm.EdgeLogPlotDL1_2013__Bartolommei_1)

#plot residuals

resid.lm.EdgePlotDI1_2011__Neuschulz_1 <- resid(lm.EdgePlotDI1_2011__Neuschulz_1)
plot(EdgePlotDI1_2011__Neuschulz_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgePlotDI1_2011__Neuschulz_1,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.EdgePlotDI1_2011__Neuschulz_1") 
abline(0, 0) 
resid.lm.EdgePlotDL1_2009__Woinarski_1 <- resid(lm.EdgePlotDL1_2009__Woinarski_1)
plot(EdgePlotDL1_2009__Woinarski_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgePlotDL1_2009__Woinarski_1,
      ylab="Residuals", xlab="Km_to_nearest_Edge", main="resid.lm.EdgePlotDL1_2009__Woinarski_1")
abline(0, 0) 
resid.lm.EdgePlotDL1_2010__Proenca_2 <- resid(lm.EdgePlotDL1_2010__Proenca_2)
plot(EdgePlotDL1_2010__Proenca_2$Km_to_nearest_edge_of_habitat, resid.lm.EdgePlotDL1_2010__Proenca_2,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.PlotDL1_2010__Proenca_2") 
abline(0, 0) 
resid.lm.EdgePlotDL1_2011__Mallari_1 <- resid(lm.EdgePlotDL1_2011__Mallari_1)
plot(EdgePlotDL1_2011__Mallari_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgePlotDL1_2011__Mallari_1,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.EdgePlotDL1_2011__Mallari_1") 
abline(0, 0)
resid.lm.EdgePlotDL1_2011__MorenoMateos_1 <- resid(lm.EdgePlotDL1_2011__MorenoMateos_1)
plot(EdgePlotDL1_2011__MorenoMateos_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgePlotDL1_2011__MorenoMateos_1,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.EdgePlotDL1_2011__MorenoMateos_1") 
abline(0, 0) 
resid.lm.EdgePlotDL1_2012__Dallimer_1 <- resid(lm.EdgePlotDL1_2012__Dallimer_1)
plot(EdgePlotDL1_2012__Dallimer_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgePlotDL1_2012__Dallimer_1,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.EdgePlotDL1_2012__Dallimer_1") 
abline(0, 0) #maybe linear
resid.lm.EdgePlotDL1_2013__Bartolommei_1 <- resid(lm.EdgePlotDL1_2013__Bartolommei_1)
plot(EdgePlotDL1_2013__Bartolommei_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgePlotDL1_2013__Bartolommei_1,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.EdgePlotDL1_2013__Bartolommei_1") 
abline(0, 0)

#plot log residuals. Only WMCBM is log due to studies containing negative as well as positive values
resid.lm.EdgeLogPlotDI1_2011__Neuschulz_1 <- resid(lm.EdgeLogPlotDI1_2011__Neuschulz_1)
plot(EdgeLogPlotDI1_2011__Neuschulz_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgeLogPlotDI1_2011__Neuschulz_1,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.LogPlotDI1_2011__Neuschulz_1") 
abline(0, 0) 
resid.lm.EdgeLogPlotDL1_2009__Woinarski_1 <- resid(lm.EdgeLogPlotDL1_2009__Woinarski_1)
plot(EdgeLogPlotDL1_2009__Woinarski_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgeLogPlotDL1_2009__Woinarski_1)
abline(0, 0) 
#(Solved) Error in xy.coords(x, y, xlabel, ylabel, log) :  'x' and 'y' lengths differ. Contains negative values
resid.lm.EdgeLogPlotDL1_2010__Proenca_2 <- resid(lm.EdgeLogPlotDL1_2010__Proenca_2)
plot(EdgeLogPlotDL1_2010__Proenca_2$Km_to_nearest_edge_of_habitat, resid.lm.EdgeLogPlotDL1_2010__Proenca_2,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.LogPlotDL1_2010__Proenca_2") 
abline(0, 0) 
resid.lm.EdgeLogPlotDL1_2011__Mallari_1 <- resid(lm.EdgeLogPlotDL1_2011__Mallari_1)
plot(EdgeLogPlotDL1_2011__Mallari_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgeLogPlotDL1_2011__Mallari_1,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.EdgeLogPlotDL1_2011__Mallari_1") 
abline(0, 0)
resid.lm.EdgeLogPlotDL1_2011__MorenoMateos_1 <- resid(lm.EdgeLogPlotDL1_2011__MorenoMateos_1)
plot(EdgeLogPlotDL1_2011__MorenoMateos_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgeLogPlotDL1_2011__MorenoMateos_1,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.EdgeLogPlotDL1_2011__MorenoMateos_1") 
abline(0, 0) 
#Error in xy.coords(x, y, xlabel, ylabel, log) : 'x' and 'y' lengths differ. (contains no negative values)
resid.lm.EdgeLogPlotDL1_2012__Dallimer_1 <- resid(lm.EdgeLogPlotDL1_2012__Dallimer_1)
plot(EdgeLogPlotDL1_2012__Dallimer_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgeLogPlotDL1_2012__Dallimer_1,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.EdgeLogPlotDL1_2012__Dallimer_1") 
abline(0, 0)
resid.lm.EdgeLogPlotDL1_2013__Bartolommei_1 <- resid(lm.EdgeLogPlotDL1_2013__Bartolommei_1)
plot(EdgeLogPlotDL1_2013__Bartolommei_1$Km_to_nearest_edge_of_habitat, resid.lm.EdgeLogPlotDL1_2013__Bartolommei_1,
     ylab="Residuals", xlab="Km_to_nearest_Edge", main="res.lm.EdgeLogPlotDL1_2013__Bartolommei_1") 
abline(0, 0)
#log is problematic for negative values of Distance_go_nearest_edge_of_habitat

lm.EdgeLogPlotDI1_2011__Neuschulz_1 <-  lm(LogCMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgeLogPlotDI1_2011__Neuschulz_1 )   # -
lm.EdgeLogPlotDL1_2009__Woinarski_1<- lm(LogCMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgeLogPlotDL1_2009__Woinarski_1 )   # +
lm.EdgeLogPlotDL1_2010__Proenca_2<- lm(LogCMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgeLogPlotDL1_2010__Proenca_2 )     # +
lm.EdgeLogPlotDL1_2011__Mallari_1<- lm(LogCMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgeLogPlotDL1_2011__Mallari_1)      # -
lm.EdgeLogPlotDL1_2011__MorenoMateos_1<- lm(LogCMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgeLogPlotDL1_2011__MorenoMateos_1) # -
lm.EdgeLogPlotDL1_2012__Dallimer_1<- lm(LogCMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgeLogPlotDL1_2012__Dallimer_1)     # -
lm.EdgeLogPlotDL1_2013__Bartolommei_1 <- lm(LogCMWBS ~ Km_to_nearest_edge_of_habitat, data =EdgeLogPlotDL1_2013__Bartolommei_1)  # -

plot(log(-1*(EdgeLogPlotDI1_2011__Neuschulz_1 $Km_to_nearest_edge_of_habitat)), EdgeLogPlotDI1_2011__Neuschulz_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")
plot(log(EdgeLogPlotDL1_2009__Woinarski_1$Km_to_nearest_edge_of_habitat),EdgeLogPlotDL1_2009__Woinarski_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")
plot(log(EdgeLogPlotDL1_2010__Proenca_2$Km_to_nearest_edge_of_habitat), EdgeLogPlotDL1_2010__Proenca_2$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")
plot(log(EdgeLogPlotDL1_2011__Mallari_1$Km_to_nearest_edge_of_habitat), EdgeLogPlotDL1_2011__Mallari_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")   
plot(log(EdgeLogPlotDL1_2011__MorenoMateos_1$Km_to_nearest_edge_of_habitat), EdgeLogPlotDL1_2011__MorenoMateos_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")
plot(log(EdgeLogPlotDL1_2012__Dallimer_1$Km_to_nearest_edge_of_habitat), EdgeLogPlotDL1_2012__Dallimer_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge") 
plot(log(EdgeLogPlotDL1_2013__Bartolommei_1$Km_to_nearest_edge_of_habitat), EdgeLogPlotDL1_2013__Bartolommei_1$LogCMWBS, ylab = "LogCWMBM", xlab = "Km_to_edge")  
#log is problematic for negative values of Distance_go_nearest_edge_of_habitat


#root doesnt work because of negative values
par(mfrow = c(2,5),
    oma = c(5,4,0,0) + 0.1,
    mar = c(4,4,1,1) + 0.1)
plot(sqrt(EdgeLogPlotDI1_2011__Neuschulz_1$Km_to_nearest_edge_of_habitat), sqrt(EdgeLogPlotDI1_2011__Neuschulz_1$LogCMWBS), ylab = "LogCWMBM", xlab = "Km_to_edge")
plot(sqrt(EdgeLogPlotDL1_2009__Woinarski_1$Km_to_nearest_edge_of_habitat),sqrt(EdgeLogPlotDL1_2009__Woinarski_1$LogCMWBS), ylab = "LogCWMBM", xlab = "Km_to_edge")
plot(sqrt(EdgeLogPlotDL1_2010__Proenca_2$Km_to_nearest_edge_of_habitat), sqrt(EdgeLogPlotDL1_2010__Proenca_2$LogCMWBS), ylab = "LogCWMBM", xlab = "Km_to_edge")
plot(sqrt(EdgeLogPlotDL1_2011__Mallari_1$Km_to_nearest_edge_of_habitat), sqrt(EdgeLogPlotDL1_2011__Mallari_1$LogCMWBS), ylab = "LogCWMBM", xlab = "Km_to_edge")   
plot(sqrt(EdgeLogPlotDL1_2011__MorenoMateos_1$Km_to_nearest_edge_of_habitat), sqrt(EdgeLogPlotDL1_2011__MorenoMateos_1$LogCMWBS), ylab = "LogCWMBM", xlab = "Km_to_edge")
plot(sqrt(EdgeLogPlotDL1_2012__Dallimer_1$Km_to_nearest_edge_of_habitat), sqrt(EdgeLogPlotDL1_2012__Dallimer_1$LogCMWBS), ylab = "LogCWMBM", xlab = "Km_to_edge") #not here yet
plot(sqrt(EdgeLogPlotDL1_2013__Bartolommei_1$Km_to_nearest_edge_of_habitat), sqrt(EdgeLogPlotDL1_2013__Bartolommei_1$LogCMWBS), ylab = "LogCWMBM", xlab = "Km_to_edge")  


#Hist normal
par(mfrow = c(2,4),
    oma = c(5,4,0,0) + 0.1,
    mar = c(4,4,1,1) + 0.1)
hist(EdgePlotDI1_2011__Neuschulz_1$CMWB, xlab = "WMCBM")
hist(EdgePlotDL1_2009__Woinarski_1$CMWBS,  xlab = "WMCBM")
hist(EdgePlotDL1_2010__Proenca_2$CMWBS,  xlab = "WMCBM")
hist(EdgePlotDL1_2011__Mallari_1$CMWBS,  xlab = "WMCBM")   
hist(EdgePlotDL1_2011__MorenoMateos_1$CMWBS,  xlab = "WMCBM")
hist(EdgePlotDL1_2012__Dallimer_1$CMWBS,  xlab = "WMCBM")
hist(EdgePlotDL1_2013__Bartolommei_1$CMWBS,  xlab = "WMCBM")  

#Hist log
par(mfrow = c(2,4),
    oma = c(5,4,0,0) + 0.1,
    mar = c(4,4,1,1) + 0.1)
hist(EdgeLogPlotDI1_2011__Neuschulz_1$LogCMWBS,  xlab = "LogCWMBM")
hist(EdgeLogPlotDL1_2009__Woinarski_1$LogCMWBS,  xlab = "LogCWMBM")
hist(EdgeLogPlotDL1_2010__Proenca_2$LogCMWBS,  xlab = "LogCWMBM")
hist(EdgeLogPlotDL1_2011__Mallari_1$LogCMWBS,  xlab = "LogCWMBM")   
hist(EdgeLogPlotDL1_2011__MorenoMateos_1$LogCMWBS,  xlab = "LogCWMBM")
hist(EdgeLogPlotDL1_2012__Dallimer_1$LogCMWBS,  xlab = "LogCWMBM") #not here yet
hist(EdgeLogPlotDL1_2013__Bartolommei_1$LogCMWBS,  xlab = "LogCWMBM")  