#This script uses a data.frame from the script "1._Selecting_Studies" and "4._Studies_With_Edge_Distance".
#Therefore, to run this script "1._Selecting_Studies" and "4._Studies_With_Edge_Distance" need to be ran first.
library(tidyr)
library(dplyr)

CE_U_TS_Factor <- factor(CE_U_TenSites$Source_ID_Study_number)
levels(CE_U_TS_Factor)


#[1] "DI1_2011__Neuschulz_1"    "DL1_2009__Woinarski_1"    "DL1_2010__Proenca_2"      "DL1_2011__Mallari_1"      "DL1_2011__MorenoMateos_1"
#[6] "DL1_2012__Dallimer_1"     "DL1_2013__Bartolommei_1"  "HW1_2012__Naoe_1"         "HW1_2012__Naoe_2"         "SC1_2011__Stouffer_1"    
#[11] "SE2_2013__Brandt_1"       "VK1_2007__StLaurent_1"    "VK1_2007__StLaurent_3"  

#SC1_2011__Stouffer_1 as only one edge distance and will be removed
#SE2_2013__Brandt_1 has three different edge distances for around 100 sites and will also be removed  --> 11 studies remain

#Selectign the studies which will be used
B_F_A_S_TenSitesEdge <- filter(B_F_A_Species,
                           Source_ID_Study_number    ==  "DI1_2011__Neuschulz_1"
                           | Source_ID_Study_number  ==  "DL1_2009__Woinarski_1"
                           | Source_ID_Study_number  ==  "DL1_2010__Proenca_2"
                           | Source_ID_Study_number  ==  "DL1_2011__Mallari_1" 
                           | Source_ID_Study_number  ==  "DL1_2011__MorenoMateos_1"
                           | Source_ID_Study_number  ==  "DL1_2012__Dallimer_1" 
                           | Source_ID_Study_number  ==  "DL1_2013__Bartolommei_1"
                           | Source_ID_Study_number  ==  "HW1_2012__Naoe_1"
                           | Source_ID_Study_number  ==  "HW1_2012__Naoe_2" 
                           | Source_ID_Study_number  ==  "VK1_2007__StLaurent_1" 
                           | Source_ID_Study_number  ==  "VK1_2007__StLaurent_3" )

#Genus variable and Species variable are combined into one new variable
GenusSpeciesEdge <- unite(B_F_A_S_TenSitesEdge,Genus_Species, Genus, Species, sep = " ") 

#Removing any double species names
GSE_Unique <- unique(GenusSpeciesEdge$Genus_Species)

#calculating amount of species
summary(GSE_Unique) # = 400

#Will be used in Acces to connect the mean species body weight with the species from the PREDICTS studies
#Stored in Bachelorproject\Acces_Body_Size\Input_From_R

write.csv(GSE_Unique, file = "C:/Users/F/Desktop/GSE_Unique.csv", row.names = FALSE)
