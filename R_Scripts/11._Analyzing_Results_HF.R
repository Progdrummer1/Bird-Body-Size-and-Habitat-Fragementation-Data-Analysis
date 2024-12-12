#This script uses a data.frame from the script "9._Calculate_MCBM_HF".
#Therefore, to run this script "9._Calculate_MCBM_HF" needs to be ran first


install.packages(("latice"))
library(latice)
library(ggplot2)
library(dplyr)

PlotDI1_2013__Azhar_1       <- filter(CMBM_HabitatFragmentation, Source_ID_Study_number == "DI1_2013__Azhar_1")
PlotDL1_2010__Proenca_2     <- filter(CMBM_HabitatFragmentation, Source_ID_Study_number == "DL1_2010__Proenca_2")
PlotDL1_2013__Bartolommei_1 <- filter(CMBM_HabitatFragmentation, Source_ID_Study_number == "DL1_2013__Bartolommei_1")
PlotHW1_2007__Chapman_1     <- filter(CMBM_HabitatFragmentation, Source_ID_Study_number == "HW1_2007__Chapman_1")
PlotMH1_2010__Sheldon_1     <- filter(CMBM_HabitatFragmentation, Source_ID_Study_number == "MH1_2010__Sheldon_1")
PlotMH1_2011__Phalan_1      <- filter(CMBM_HabitatFragmentation, Source_ID_Study_number == "MH1_2011__Phalan_1") 
PlotSC1_2005__Marsh_1       <- filter(CMBM_HabitatFragmentation, Source_ID_Study_number == "SC1_2005__Marsh_1") 

PlotSC1_2010__ReyBenayas_1_WithNA  <- filter(CMBM_HabitatFragmentation, Source_ID_Study_number == "SC1_2010__ReyBenayas_1")
summary(PlotSC1_2010__ReyBenayas_1_WithNA$Core_Area_Index)  #contains NA's!!   
#probably because the sites it fell outside the CAI map!

PlotSC1_2010__ReyBenayas_1 <- filter(PlotSC1_2010__ReyBenayas_1_WithNA, Core_Area_Index != "NA")
PlotSC2_2012__Santana_1     <- filter(CMBM_HabitatFragmentation, Source_ID_Study_number == "SC2_2012__Santana_1") 
PlotVK1_2007__StLaurent_3   <- filter(CMBM_HabitatFragmentation, Source_ID_Study_number == "VK1_2007__StLaurent_3")


install.packages("Kendall")
library(Kendall)
#Kendall's dau 
Kendall(PlotDI1_2013__Azhar_1$Core_Area_Index, PlotDI1_2013__Azhar_1$CMWBS) 
# tau = -0.0731, 2-sided pvalue =0.4112
Kendall(PlotDL1_2010__Proenca_2$Core_Area_Index, PlotDL1_2010__Proenca_2$CMWBS) 
#tau = 0.244, 2-sided pvalue =0.088698
Kendall(PlotDL1_2013__Bartolommei_1$Core_Area_Index, PlotDL1_2013__Bartolommei_1$CMWBS) 
#tau = 0.605, 2-sided pvalue =0.0086868
Kendall(PlotHW1_2007__Chapman_1$Core_Area_Index,PlotHW1_2007__Chapman_1$CMWBS)  
# tau = -0.152, 2-sided pvalue =0.0066579
Kendall(PlotMH1_2011__Phalan_1$Core_Area_Index, PlotMH1_2011__Phalan_1$CMWBS)  
# tau = 0.0848, 2-sided pvalue =0.68411
Kendall(PlotSC1_2010__ReyBenayas_1$Core_Area_Index, PlotSC1_2010__ReyBenayas_1$CMWBS)
# tau = -0.048, 2-sided pvalue =0.53005
Kendall(PlotSC2_2012__Santana_1$Core_Area_Index, PlotSC2_2012__Santana_1$CMWBS) 
# tau = 0.151, 2-sided pvalue =0.14529
Kendall(PlotVK1_2007__StLaurent_3$Core_Area_Index, PlotVK1_2007__StLaurent_3$CMWBS) 
# = tau = -0.0583, 2-sided pvalue =0.52583
Kendall(PlotSC1_2005__Marsh_1$Core_Area_Index, PlotSC1_2005__Marsh_1$CMWBS) 
# tau = 0.183, 2-sided pvalue =0.0050659
Kendall(PlotMH1_2010__Sheldon_1$Core_Area_Index, PlotMH1_2010__Sheldon_1$CMWBS) 
# tau = 0.182, 2-sided pvalue =0.1552

##Exporting the plots in the same size. Plot window width till here####----->
#Plot with Kendall's tau
plot(PlotDI1_2013__Azhar_1$Core_Area_Index, PlotDI1_2013__Azhar_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "Core area index", main = "Azhar", xlim=c(0, 1.2))
text(1.05, 70, labels = "2-sided pvalue =0.411") 
text(1.13, 95, labels = "tau = -0.073")  
plot(PlotDL1_2010__Proenca_2$Core_Area_Index, PlotDL1_2010__Proenca_2$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "Core area index", main = "Proenca", xlim=c(0,0.007))
text(0.00610, 14, labels = "2-sided pvalue =0.089")
text(0.00665, 19, labels = "tau = 0.244") #
plot(PlotDL1_2013__Bartolommei_1$Core_Area_Index,PlotDL1_2013__Bartolommei_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "Core area index", main = "Bartolommei", xlim=c(-0.002, 0.025))   
text(0.0209, 110, labels = " 2-sided pvalue =0.009") 
text(0.023, 125, labels = "tau = 0.605") 
plot(PlotHW1_2007__Chapman_1$Core_Area_Index,PlotHW1_2007__Chapman_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "Core area index", main = "Chapman", xlim=c(-0.002, 0.034))   
text(0.0285, 15, labels = "2-sided pvalue =0.007") 
text(0.0312, 40, labels = "tau = -0.152") 
plot(PlotMH1_2011__Phalan_1$Core_Area_Index, PlotMH1_2011__Phalan_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "Core area index", main = "Phalan")  
text(0.86, 22.5, labels = "2-sided pvalue =0.684") # #
text(0.93, 27.5, labels = "tau = 0.085") # 
plot(PlotSC2_2012__Santana_1$Core_Area_Index, PlotSC2_2012__Santana_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "Core area index", main = "Santana")     
text(0.00119, 20, labels = "2-sided pvalue =0.145") #
text(0.0013, 24, labels = "tau = 0.15") #
plot(PlotVK1_2007__StLaurent_3$Core_Area_Index, PlotVK1_2007__StLaurent_3$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "Core area index", main = "StLaurent", xlim = c(-0.001,0.15))
text(0.13, 10, labels = "2-sided pvalue =0.526")# 
text(0.141, 11.6, labels = "tau = -0.058") # 
plot(PlotSC1_2010__ReyBenayas_1$Core_Area_Index, PlotSC1_2010__ReyBenayas_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "Core area index", main = "ReyBenayas") 
text(0.0111, 14, labels = "2-sided pvalue =0.530") 
text(0.012, 32, labels = "tau = -0.048") # = 
plot(PlotSC1_2005__Marsh_1$Core_Area_Index, PlotSC1_2005__Marsh_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "Core area index", main = "Marsh", xlim = c(-0.01,0.48))  
text(0.418, 12, labels = "2-sided pvalue =0.005") 
text(0.453, 34, labels = "tau = 0.183") # = 
plot(PlotMH1_2010__Sheldon_1$Core_Area_Index, PlotMH1_2010__Sheldon_1$CMWBS, ylab = "Weighted mean community body mass (g)", xlab = "Core area index", main = "Sheldon")
text(0.70, 18, labels = "2-sided pvalue =0.155") 
text(0.76, 22.5, labels = "tau = 0.182") #

#Species per study

DI1_2013__Azhar_1 <- filter(TST_FilteredHF,
                            Source_ID_Study_number  == "DI1_2013__Azhar_1")
n_distinct(DI1_2013__Azhar_1$Species)
DL1_2010__Proenca_2 <- filter(TST_FilteredHF,
                              Source_ID_Study_number  == "DL1_2010__Proenca_2")
n_distinct(DL1_2010__Proenca_2$Species)
DL1_2013__Bartolommei_1 <- filter(TST_FilteredHF,
                                  Source_ID_Study_number  == "DL1_2013__Bartolommei_1" )
n_distinct(DL1_2013__Bartolommei_1$Species)
HW1_2007__Chapman_1 <- filter(TST_FilteredHF,
                              Source_ID_Study_number  == "HW1_2007__Chapman_1")
n_distinct(HW1_2007__Chapman_1$Species)
MH1_2010__Sheldon_1 <- filter(TST_FilteredHF,
                              Source_ID_Study_number  == "MH1_2010__Sheldon_1")
n_distinct(MH1_2010__Sheldon_1$Species)
MH1_2011__Phalan_1 <- filter(TST_FilteredHF,
                             Source_ID_Study_number  == "MH1_2011__Phalan_1" )
n_distinct(MH1_2011__Phalan_1$Species)
SC1_2005__Marsh_1 <- filter(TST_FilteredHF,
                            Source_ID_Study_number  == "SC1_2005__Marsh_1" )
n_distinct(SC1_2005__Marsh_1$Species)
SC1_2010__ReyBenayas_1 <- filter(TST_FilteredHF,
                                 Source_ID_Study_number  == "SC1_2010__ReyBenayas_1")
n_distinct(SC1_2010__ReyBenayas_1$Species)
SC2_2012__Santana_1 <- filter(TST_FilteredHF,
                              Source_ID_Study_number  == "SC2_2012__Santana_1")
n_distinct(SC2_2012__Santana_1$Species)
VK1_2007__StLaurent_3<- filter(TST_FilteredHF,
                               Source_ID_Study_number  == "VK1_2007__StLaurent_3" )
n_distinct(VK1_2007__StLaurent_3$Species)

#amount of sites per study
n_distinct()
n_distinct(PlotDI1_2013__Azhar_1 )
n_distinct(PlotDL1_2013__Bartolommei_1 )
n_distinct(PlotDL1_2010__Proenca_2 )
n_distinct(PlotHW1_2007__Chapman_1)
n_distinct(PlotMH1_2011__Phalan_1)
n_distinct(PlotSC1_2010__ReyBenayas_1)
n_distinct(PlotSC2_2012__Santana_1 )
n_distinct(PlotVK1_2007__StLaurent_3 )
n_distinct(PlotSC1_2005__Marsh_1 )
n_distinct(PlotMH1_2010__Sheldon_1)

#Mean WMCBS
mean(PlotDI1_2013__Azhar_1$CMWBS )
mean(PlotDL1_2013__Bartolommei_1$CMWBS  )

mean(PlotDL1_2010__Proenca_2$CMWBS )
mean(PlotHW1_2007__Chapman_1$CMWBS)
mean(PlotMH1_2011__Phalan_1$CMWBS)
mean(PlotSC1_2010__ReyBenayas_1$CMWBS)
mean(PlotSC2_2012__Santana_1$CMWBS )
mean(PlotVK1_2007__StLaurent_3$CMWBS )
mean(PlotSC1_2005__Marsh_1$CMWBS )
mean(PlotMH1_2010__Sheldon_1$CMWBS)

?mean
?average

sd
sd(PlotDI1_2013__Azhar_1$CMWBS )
sd(PlotDL1_2013__Bartolommei_1$CMWBS  )
sd(PlotDL1_2010__Proenca_2$CMWBS )
sd(PlotHW1_2007__Chapman_1$CMWBS)
sd(PlotMH1_2011__Phalan_1$CMWBS)
sd(PlotSC1_2010__ReyBenayas_1$CMWBS)
sd(PlotSC2_2012__Santana_1$CMWBS )
sd(PlotVK1_2007__StLaurent_3$CMWBS )
sd(PlotSC1_2005__Marsh_1$CMWBS )
sd(PlotMH1_2010__Sheldon_1$CMWBS)
?sd

#Mean CAI
mean(PlotDI1_2013__Azhar_1$Core_Area_Index )
mean(PlotDL1_2010__Proenca_2$Core_Area_Index )
mean(PlotDL1_2013__Bartolommei_1$Core_Area_Index)
mean(PlotHW1_2007__Chapman_1$Core_Area_Index)
mean(PlotMH1_2011__Phalan_1$Core_Area_Index)
mean(PlotSC1_2010__ReyBenayas_1$Core_Area_Index)
mean(PlotSC2_2012__Santana_1$Core_Area_Index )
mean(PlotVK1_2007__StLaurent_3$Core_Area_Index )
mean(PlotSC1_2005__Marsh_1$Core_Area_Index )
mean(PlotMH1_2010__Sheldon_1$Core_Area_Index)

?mean
?average

#Sd CAI
sd(PlotDI1_2013__Azhar_1$Core_Area_Index )
sd(PlotDL1_2013__Bartolommei_1$Core_Area_Index)
sd(PlotDL1_2010__Proenca_2$Core_Area_Index )
sd(PlotHW1_2007__Chapman_1$Core_Area_Index)
sd(PlotMH1_2011__Phalan_1$Core_Area_Index)
sd(PlotSC1_2010__ReyBenayas_1$Core_Area_Index)
sd(PlotSC2_2012__Santana_1$Core_Area_Index )
sd(PlotVK1_2007__StLaurent_3$Core_Area_Index )
sd(PlotSC1_2005__Marsh_1$Core_Area_Index )
sd(PlotMH1_2010__Sheldon_1$Core_Area_Index)

#Finding UN regions and UN subregions
RawPREDICTS <- readRDS("C:/Users/F/Desktop/Uva/Bachelor Project All/Data PREDICTS/RDS files/database.RDS", refhook = NULL) # select database.RDS
RP_Regions <- select(RawPREDICTS, Source_ID, UN_subregion,UN_region)
rm(RawPREDICTS)

RP_R_selectstudies <- filter(RP_Regions,    
                             Source_ID  == "DI1_2013__Azhar" 
                             | Source_ID  == "DL1_2010__Proenca" 
                             | Source_ID  == "HW1_2007__Chapman" 
                             | Source_ID  == "MH1_2010__Sheldon" 
                             | Source_ID  == "MH1_2011__Phalan" 
                             | Source_ID  == "SC1_2005__Marsh" 
                             | Source_ID  == "SC1_2010__ReyBenayas" 
                             | Source_ID  == "SC2_2012__Santana"
                             | Source_ID  == "VK1_2007__StLaurent" )

levels(RP_R_selectstudies$UN_subregion)

##########################################################################################
#From here follows the analysis of why no linear relation was present within the studies.#
##########################################################################################


#log-transformed data
LogPlotDI1_2013__Azhar_1       <- filter(LogCMBM_HabitatFragmentation, Source_ID_Study_number == "DI1_2013__Azhar_1")
LogPlotDL1_2010__Proenca_2     <- filter(LogCMBM_HabitatFragmentation, Source_ID_Study_number == "DL1_2010__Proenca_2")
LogPlotDL1_2013__Bartolommei_1 <- filter(LogCMBM_HabitatFragmentation, Source_ID_Study_number == "DL1_2013__Bartolommei_1")
LogPlotHW1_2007__Chapman_1     <- filter(LogCMBM_HabitatFragmentation, Source_ID_Study_number == "HW1_2007__Chapman_1")
LogPlotMH1_2010__Sheldon_1     <- filter(LogCMBM_HabitatFragmentation, Source_ID_Study_number == "MH1_2010__Sheldon_1")
LogPlotMH1_2011__Phalan_1      <- filter(LogCMBM_HabitatFragmentation, Source_ID_Study_number == "MH1_2011__Phalan_1") 
LogPlotSC1_2005__Marsh_1       <- filter(LogCMBM_HabitatFragmentation, Source_ID_Study_number == "SC1_2005__Marsh_1") 
LogPlotSC1_2010__ReyBenayas_1  <- filter(LogCMBM_HabitatFragmentation, Source_ID_Study_number == "SC1_2010__ReyBenayas_1")
LogPlotSC2_2012__Santana_1     <- filter(LogCMBM_HabitatFragmentation, Source_ID_Study_number == "SC2_2012__Santana_1") 
LogPlotVK1_2007__StLaurent_3   <- filter(LogCMBM_HabitatFragmentation, Source_ID_Study_number == "VK1_2007__StLaurent_3")

#linear regressions
lm.LogPlotDI1_2013__Azhar_1 <-  lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotDI1_2013__Azhar_1)
lm.LogPlotDL1_2010__Proenca_2 <- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotDL1_2010__Proenca_2)
lm.LogPlotMH1_2010__Sheldon_1<- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotMH1_2010__Sheldon_1)
lm.LogPlotMH1_2011__Phalan_1<- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotMH1_2011__Phalan_1)
lm.LogPlotSC1_2005__Marsh_1<- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotSC1_2005__Marsh_1) 
lm.LogPlotSC2_2012__Santana_1<- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotSC2_2012__Santana_1)
lm.LogPlotVK1_2007__StLaurent_3<- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotVK1_2007__StLaurent_3)

#contained zero values
lm.LogPlotDL1_2013__Bartolommei_1<- lm(LogCMWBS ~ log(Core_Area_Index+1), data =LogPlotDL1_2013__Bartolommei_1 ) 
lm.LogPlotHW1_2007__Chapman_1<- lm(LogCMWBS ~ log(Core_Area_Index+1), data =LogPlotHW1_2007__Chapman_1 )     
lm.LogPlotSC1_2010__ReyBenayas_1<- lm(LogCMWBS ~ log(Core_Area_Index+1), data =LogPlotSC1_2010__ReyBenayas_1 )  

#Plot normal

par(mfrow = c(2,5),
    oma = c(5,4,0,0) + 0.1,
    mar = c(4,4,1,1) + 0.1)
plot(PlotDI1_2013__Azhar_1$Core_Area_Index, PlotDI1_2013__Azhar_1$CMWBS, ylab = "CWMBM", xlab = "CAI")
plot(PlotDL1_2010__Proenca_2$Core_Area_Index, PlotDL1_2010__Proenca_2$CMWBS, ylab = "CWMBM", xlab = "CAI")
plot(PlotDL1_2013__Bartolommei_1$Core_Area_Index, PlotDL1_2013__Bartolommei_1$CMWBS, ylab = "CWMBM", xlab = "CAI")
plot(PlotHW1_2007__Chapman_1$Core_Area_Index,PlotHW1_2007__Chapman_1$CMWBS, ylab = "CWMBM", xlab = "CAI")   
plot(PlotMH1_2010__Sheldon_1$Core_Area_Index, PlotMH1_2010__Sheldon_1$CMWBS, ylab = "CWMBM", xlab = "CAI")
plot(PlotMH1_2011__Phalan_1$Core_Area_Index, PlotMH1_2011__Phalan_1$CMWBS, ylab = "CWMBM", xlab = "CAI")  
plot(PlotSC1_2005__Marsh_1$Core_Area_Index, PlotSC1_2005__Marsh_1$CMWBS, ylab = "CWMBM", xlab = "CAI")  
plot(PlotSC1_2010__ReyBenayas_1$Core_Area_Index, PlotSC1_2010__ReyBenayas_1$CMWBS, ylab = "CWMBM", xlab = "CAI") 
plot(PlotSC2_2012__Santana_1$Core_Area_Index, PlotSC2_2012__Santana_1$CMWBS, ylab = "CWMBM", xlab = "CAI")     
plot(PlotVK1_2007__StLaurent_3$Core_Area_Index, PlotVK1_2007__StLaurent_3$CMWBS, ylab = "CWMBM", xlab = "CAI")

#Plot log
par(mfrow = c(2,5),
    oma = c(5,4,0,0) + 0.1,
    mar = c(4,4,1,1) + 0.1)
plot(log(LogPlotDI1_2013__Azhar_1$Core_Area_Index), LogPlotDI1_2013__Azhar_1$LogCMWBS,  ylab = "LogCWMBM", xlab = "LogCAI", main="LogPlotDI1_2013__Azhar_1")
abline(lm.LogPlotDI1_2013__Azhar_1 )                  # Tropical & Subtropical Moist Broadleaf Forests
plot(log(LogPlotMH1_2010__Sheldon_1$Core_Area_Index), LogPlotMH1_2010__Sheldon_1$LogCMWBS,  ylab = "LogCWMBM", xlab = "LogCAI")
abline(lm.LogPlotMH1_2010__Sheldon_1 )                # Tropical & Subtropical Moist Broadleaf Forests
plot(log(LogPlotMH1_2011__Phalan_1$Core_Area_Index), LogPlotMH1_2011__Phalan_1$LogCMWBS,  ylab = "LogCWMBM", xlab = "LogCAI")  
abline(lm.LogPlotMH1_2011__Phalan_1)                  # Tropical & Subtropical Moist Broadleaf Forests
plot(log(LogPlotSC1_2005__Marsh_1$Core_Area_Index), LogPlotSC1_2005__Marsh_1$LogCMWBS,  ylab = "LogCWMBM", xlab = "LogCAI")  
abline(lm.LogPlotSC1_2005__Marsh_1)                   # Tropical & Subtropical Moist Broadleaf Forests
plot(log(LogPlotDL1_2010__Proenca_2$Core_Area_Index),LogPlotDL1_2010__Proenca_2$LogCMWBS,  ylab = "LogCWMBM", xlab = "LogCAI")
abline(lm.LogPlotDL1_2010__Proenca_2)                 # Temperate Broadleaf & Mixed Forests
plot(log(LogPlotSC2_2012__Santana_1$Core_Area_Index), LogPlotSC2_2012__Santana_1$LogCMWBS,  ylab = "LogCWMBM", xlab = "LogCAI")     
abline(lm.LogPlotSC2_2012__Santana_1 )                # Mediterranean Forests, Woodlands & Scrub
plot(log(PlotVK1_2007__StLaurent_3$Core_Area_Index), LogPlotVK1_2007__StLaurent_3$LogCMWBS,  ylab = "LogCWMBM", xlab = "LogCAI")
abline(lm.LogPlotVK1_2007__StLaurent_3)               # Boreal Forests/Taiga

#contained 0 values
plot(log(LogPlotHW1_2007__Chapman_1$Core_Area_Index+1), LogPlotHW1_2007__Chapman_1$LogCMWBS,  ylab = "LogCWMBM", xlab = "LogCAI")  
abline(lm.LogPlotHW1_2007__Chapman_1)                 # Temperate Broadleaf & Mixed Forests
plot(log(LogPlotDL1_2013__Bartolommei_1$Core_Area_Index+1), LogPlotDL1_2013__Bartolommei_1$LogCMWBS,  ylab = "LogCWMBM", xlab = "LogCAI")
abline(lm.LogPlotDL1_2013__Bartolommei_1)             # Mediterranean Forests, Woodlands & Scrub
plot(log(LogPlotSC1_2010__ReyBenayas_1$Core_Area_Index+1), LogPlotSC1_2010__ReyBenayas_1$LogCMWBS,  ylab = "LogCWMBM", xlab = "LogCAI") 
abline(lm.LogPlotSC1_2010__ReyBenayas_1)              #  Mediterranean Forests, Woodlands & Scrub

#Plot residuals 
#This will be done by plotting a residual plot and to look whether the point cloud is
#symmetric, whether there is no bending in the point cloud and whether there is an equal 
#variation of the points among the x-axis (van Loon, 2016).  If a linear relation is found 
#within studies, a linear regression will be executed within studies.

#Plotting residuals 
lm.PlotDI1_2013__Azhar_1 <-  lm(CMWBS ~ (Core_Area_Index), data =PlotDI1_2013__Azhar_1 )       # -
lm.PlotDL1_2010__Proenca_2 <- lm(CMWBS ~ (Core_Area_Index), data =PlotDL1_2010__Proenca_2 )     # +
lm.PlotDL1_2013__Bartolommei_1<- lm(CMWBS ~ (Core_Area_Index), data =PlotDL1_2013__Bartolommei_1 ) # +
lm.PlotHW1_2007__Chapman_1<- lm(CMWBS ~ (Core_Area_Index), data =PlotHW1_2007__Chapman_1 )     # -
lm.PlotMH1_2010__Sheldon_1<- lm(CMWBS ~ (Core_Area_Index), data =PlotMH1_2010__Sheldon_1 )     # -
lm.PlotMH1_2011__Phalan_1<- lm(CMWBS ~ (Core_Area_Index), data =PlotMH1_2011__Phalan_1 )      # +
lm.PlotSC1_2005__Marsh_1<- lm(CMWBS ~ (Core_Area_Index), data =PlotSC1_2005__Marsh_1 )       # +
lm.PlotSC1_2010__ReyBenayas_1<- lm(CMWBS ~ (Core_Area_Index), data =PlotSC1_2010__ReyBenayas_1 )  # -
lm.PlotSC2_2012__Santana_1<- lm(CMWBS ~ (Core_Area_Index), data =PlotSC2_2012__Santana_1 )     # -
lm.PlotVK1_2007__StLaurent_3<- lm(CMWBS ~ (Core_Area_Index), data =PlotVK1_2007__StLaurent_3 )   # -

res.lm.PlotDI1_2013__Azhar_1 <-  resid(lm.PlotDI1_2013__Azhar_1 )       # -
res.lm.PlotDL1_2010__Proenca_2 <- resid(lm.PlotDL1_2010__Proenca_2 )     # +
res.lm.PlotDL1_2013__Bartolommei_1<- resid(lm.PlotDL1_2013__Bartolommei_1 ) # + 
res.lm.PlotHW1_2007__Chapman_1<- resid(lm.PlotHW1_2007__Chapman_1 )     # - 
res.lm.PlotMH1_2010__Sheldon_1<-resid(lm.PlotMH1_2010__Sheldon_1 )     # -
res.lm.PlotMH1_2011__Phalan_1<- resid(lm.PlotMH1_2011__Phalan_1 )      # +
res.lm.PlotSC1_2005__Marsh_1<- resid(lm.PlotSC1_2005__Marsh_1 )       # +
res.lm.PlotSC1_2010__ReyBenayas_1<- resid(lm.PlotSC1_2010__ReyBenayas_1)  # - 
res.lm.PlotSC2_2012__Santana_1<- resid(lm.PlotSC2_2012__Santana_1 )     # -
res.lm.PlotVK1_2007__StLaurent_3<- resid(lm.PlotVK1_2007__StLaurent_3 )   # -

str(res.lm.PlotSC1_2010__ReyBenayas_1)
str(lm.PlotSC1_2010__ReyBenayas_1)

#Plotting residuals 
par(mfrow = c(2,1),
    oma = c(5,4,0,0) + 0.1,
    mar = c(4,4,1,1) + 0.1)
hist(res.lm.PlotDI1_2013__Azhar_1) 
plot(PlotDI1_2013__Azhar_1$Core_Area_Index, res.lm.PlotDI1_2013__Azhar_1, 
     ylab="Residuals", xlab="Core_Area_Index", main="res.lm.PlotDI1_2013__Azhar_1") 
abline(0, 0)  
hist(res.lm.PlotDL1_2010__Proenca_2) 
plot(PlotDL1_2010__Proenca_2$Core_Area_Index, res.lm.PlotDL1_2010__Proenca_2, 
     ylab="Residuals", xlab="Core_Area_Index", main="res.lm.PlotDL1_2010__Proenca_2") 
abline(0, 0)  
hist(res.lm.PlotDL1_2013__Bartolommei_1)
plot(PlotDL1_2013__Bartolommei_1$Core_Area_Index, res.lm.PlotDL1_2013__Bartolommei_1, 
     ylab="Residuals", xlab="Core_Area_Index", main="res.lm.PlotDL1_2013__Bartolommei_1") 
abline(0, 0)  
hist(res.lm.PlotHW1_2007__Chapman_1)
plot(PlotHW1_2007__Chapman_1$Core_Area_Index, res.lm.PlotHW1_2007__Chapman_1, 
     ylab="Residuals", xlab="Core_Area_Index", main="res.lm.PlotHW1_2007__Chapman_1") 
abline(0, 0)  
hist(res.lm.PlotMH1_2010__Sheldon_1)
plot(PlotMH1_2010__Sheldon_1$Core_Area_Index, res.lm.PlotMH1_2010__Sheldon_1, 
     ylab="Residuals", xlab="Core_Area_Index", main="res.lm.PlotMH1_2010__Sheldon_1") 
abline(0, 0)
hist(res.lm.PlotMH1_2011__Phalan_1)
plot(PlotMH1_2011__Phalan_1$Core_Area_Index, res.lm.PlotMH1_2011__Phalan_1, 
     ylab="Residuals", xlab="Core_Area_Index", main="res.lm.PlotMH1_2011__Phalan_1") 
abline(0, 0)  
hist(res.lm.PlotSC1_2005__Marsh_1)
plot(PlotSC1_2005__Marsh_1$Core_Area_Index, res.lm.PlotSC1_2005__Marsh_1, 
     ylab="Residuals", xlab="Core_Area_Index", main="res.lm.PlotSC1_2005__Marsh_1") 
abline(0, 0)  
hist(res.lm.LogPlotSC2_2012__Santana_1)
plot(LogPlotSC2_2012__Santana_1$Core_Area_Index, res.lm.LogPlotSC2_2012__Santana_1, 
     ylab="Residuals", xlab="Core_Area_Index", main="res.lm.LogPlotSC1_2005__Marsh_1") 
abline(0, 0)  #looks bad when looking at the normal plot

#Plotting log residuals 
lm.LogPlotDI1_2013__Azhar_1 <-  lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotDI1_2013__Azhar_1 )       # -
lm.LogPlotDL1_2010__Proenca_2 <- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotDL1_2010__Proenca_2 )     # +
lm.LogPlotDL1_2013__Bartolommei_1<- lm(LogCMWBS ~ log(Core_Area_Index+1), data =LogPlotDL1_2013__Bartolommei_1 ) # +
lm.LogPlotHW1_2007__Chapman_1<- lm(LogCMWBS ~ log(Core_Area_Index+1), data =LogPlotHW1_2007__Chapman_1 )     # -
lm.LogPlotMH1_2010__Sheldon_1<- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotMH1_2010__Sheldon_1 )     # -
lm.LogPlotMH1_2011__Phalan_1<- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotMH1_2011__Phalan_1 )      # +
lm.LogPlotSC1_2005__Marsh_1<- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotSC1_2005__Marsh_1 )       # +
lm.LogPlotSC1_2010__ReyBenayas_1<- lm(LogCMWBS ~ log(Core_Area_Index+1), data =LogPlotSC1_2010__ReyBenayas_1 )  # -
lm.LogPlotSC2_2012__Santana_1<- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotSC2_2012__Santana_1 )     # -
lm.LogPlotVK1_2007__StLaurent_3<- lm(LogCMWBS ~ log(Core_Area_Index), data =LogPlotVK1_2007__StLaurent_3 )   # -

res.lm.LogPlotDI1_2013__Azhar_1 <-  resid(lm.LogPlotDI1_2013__Azhar_1 )       # -
res.lm.LogPlotDL1_2010__Proenca_2 <- resid(lm.LogPlotDL1_2010__Proenca_2 )     # +
res.lm.LogPlotDL1_2013__Bartolommei_1<- resid(lm.LogPlotDL1_2013__Bartolommei_1 ) # + 
res.lm.LogPlotHW1_2007__Chapman_1<- resid(lm.LogPlotHW1_2007__Chapman_1 )     # - 
res.lm.LogPlotMH1_2010__Sheldon_1<-resid(lm.LogPlotMH1_2010__Sheldon_1 )     # -
res.lm.LogPlotMH1_2011__Phalan_1<- resid(lm.LogPlotMH1_2011__Phalan_1 )      # +
res.lm.LogPlotSC1_2005__Marsh_1<- resid(lm.LogPlotSC1_2005__Marsh_1 )       # +
res.lm.LogPlotSC1_2010__ReyBenayas_1<- resid(lm.LogPlotSC1_2010__ReyBenayas_1)  # - 
res.lm.LogPlotSC2_2012__Santana_1<- resid(lm.LogPlotSC2_2012__Santana_1 )     # -
res.lm.LogPlotVK1_2007__StLaurent_3<- resid(lm.LogPlotVK1_2007__StLaurent_3 )   # -

str(res.lm.LogPlotSC1_2010__ReyBenayas_1)
str(lm.LogPlotSC1_2010__ReyBenayas_1)

#Plotting log residuals 
par(mfrow = c(2,1),
    oma = c(5,4,0,0) + 0.1,
    mar = c(4,4,1,1) + 0.1)
hist(res.lm.LogPlotDI1_2013__Azhar_1) 
plot(LogPlotDI1_2013__Azhar_1$Core_Area_Index, res.lm.LogPlotDI1_2013__Azhar_1, 
     ylab="Residuals", xlab="LogCore_Area_Index", main="res.lm.LogPlotDI1_2013__Azhar_1") 
abline(0, 0)  
hist(res.lm.LogPlotDL1_2010__Proenca_2) 
plot(LogPlotDL1_2010__Proenca_2$Core_Area_Index, res.lm.LogPlotDL1_2010__Proenca_2, 
     ylab="Residuals", xlab="LogCore_Area_Index", main="res.lm.LogPlotDL1_2010__Proenca_2") 
abline(0, 0)  # Looks pretty decent
hist(res.lm.LogPlotDL1_2013__Bartolommei_1)
plot(LogPlotDL1_2013__Bartolommei_1$Core_Area_Index, res.lm.LogPlotDL1_2013__Bartolommei_1, 
     ylab="Residuals", xlab="LogCore_Area_Index", main="res.lm.LogPlotDL1_2013__Bartolommei_1") 
abline(0, 0)  
hist(res.lm.LogPlotHW1_2007__Chapman_1)
plot(LogPlotHW1_2007__Chapman_1$Core_Area_Index, res.lm.LogPlotHW1_2007__Chapman_1, 
     ylab="Residuals", xlab="LogCore_Area_Index", main="res.lm.LogPlotHW1_2007__Chapman_1") 
abline(0, 0)  
hist(res.lm.LogPlotMH1_2010__Sheldon_1)
plot(LogPlotMH1_2010__Sheldon_1$Core_Area_Index, res.lm.LogPlotMH1_2010__Sheldon_1, 
     ylab="Residuals", xlab="LogCore_Area_Index", main="res.lm.LogPlotMH1_2010__Sheldon_1") 
abline(0, 0)
hist(res.lm.LogPlotMH1_2011__Phalan_1)
plot(LogPlotMH1_2011__Phalan_1$Core_Area_Index, res.lm.LogPlotMH1_2011__Phalan_1, 
     ylab="Residuals", xlab="LogCore_Area_Index", main="res.lm.LogPlotMH1_2011__Phalan_1") 
abline(0, 0)  
hist(res.lm.LogPlotSC1_2005__Marsh_1)
plot(LogPlotSC1_2005__Marsh_1$Core_Area_Index, res.lm.LogPlotSC1_2005__Marsh_1, 
     ylab="Residuals", xlab="LogCore_Area_Index", main="res.lm.LogPlotSC1_2005__Marsh_1") 
abline(0, 0)  

hist(res.lm.LogPlotSC1_2010__ReyBenayas_1) 
plot(LogPlotSC1_2010__ReyBenayas_1$Core_Area_Index,
     res.lm.LogPlotSC1_2010__ReyBenayas_1,
     ylab="Residuals", xlab="LogCore_Area_Index", main="res.lm.LogPlotSC1_2010__ReyBenayas_1") 
#abline(0, 0)  #'x' and 'y' lengths differ
hist(res.lm.LogPlotSC2_2012__Santana_1)
plot(LogPlotSC2_2012__Santana_1$Core_Area_Index, res.lm.LogPlotSC2_2012__Santana_1, 
     ylab="Residuals", xlab="LogCore_Area_Index", main="res.lm.LogPlotSC2_2012__Santana_1")
abline(0, 0)  #not equally distributed among x axis
hist(res.lm.LogPlotVK1_2007__StLaurent_3)
plot(LogPlotVK1_2007__StLaurent_3$Core_Area_Index, res.lm.LogPlotVK1_2007__StLaurent_3, 
     ylab="Residuals", xlab="LogCore_Area_Index", main="res.lm.LogPlotVK1_2007__StLaurent_3")
abline(0, 0)  

#Conclusion
#DI1_2013__Azhar_1 residual Plot is not symmetric. Violates assumption of parametric statistics.
#DL1_2010__Proenca_2 residual plot is not symmetric. Violates assumption of parametric statistics.
#However, DL1_2010__Proenca_2 log residual plot looks pretty good. 
#The plotted log looks a bit like a fan though.
#PlotDL1_2013__Bartolommei_1 residual plot is not symmetric. Violates assumption of parametric statistics.
#HW1_2007__Chapman_1 residual plot is not symmetric. Violates assumption of parametric statistics.
#MH1_2011__Phalan_1 residual plot looks bad. Log residual plot looks a lot better. Maybe parametric can be used.
#SC2_2012__Santana_1 residual plot looks skewed. 
#VK1_2007__StLaurent_3 Residual plot is not symmetric.
#SC1_2005__Marsh_1. No equal distribution among x axis. 
#MH1_2010__Sheldon_1. No equal distribution among x axis. No symetrical point cloud. 