#This script uses a data.frame from the script "1._Selecting_Studies" and "3._Extracted_Sites_HF_Ten_Min_Sites".
#Therefore, to run this script "1._Selecting_Studies" and "3._Extracted_Sites_HF_Ten_Min_Sites" need to be ran first.
library('dplyr')
library('tidyr')

ES_U_TS_Factor <- factor(ES_U_TenSites$Source_ID_Study_number)
levels(ES_U_TS_Factor)

#[1] "DI1_2013__Azhar_1"       "DL1_2010__Proenca_2"     "DL1_2013__Bartolommei_1"
#[4] "DL1_2013__deThoisy_1"    "HW1_2007__Chapman_1"     "HW1_2008__Lantschner_1" 
#[7] "MH1_2010__Sheldon_1"     "MH1_2011__Phalan_1"      "SC1_2005__Marsh_1"      
#[10] "SC1_2010__ReyBenayas_1"  "SC2_2012__Santana_1"     "VK1_2007__StLaurent_1"  
#[13] "VK1_2007__StLaurent_3"  

B_F_A_S_TenSitesFrag <- filter(B_F_A_Species,
                          Source_ID_Study_number  == "DI1_2013__Azhar_1" 
                        | Source_ID_Study_number  == "DL1_2010__Proenca_2" 
                        | Source_ID_Study_number  == "DL1_2013__Bartolommei_1"  
                        | Source_ID_Study_number  == "DL1_2013__deThoisy_1" 
                        | Source_ID_Study_number  == "HW1_2007__Chapman_1" 
                        | Source_ID_Study_number  == "HW1_2008__Lantschner_1" 
                        | Source_ID_Study_number  == "MH1_2010__Sheldon_1" 
                        | Source_ID_Study_number  == "MH1_2011__Phalan_1" 
                        | Source_ID_Study_number  == "SC1_2005__Marsh_1" 
                        | Source_ID_Study_number  == "SC1_2010__ReyBenayas_1" 
                        | Source_ID_Study_number  == "SC2_2012__Santana_1"
                        | Source_ID_Study_number  == "VK1_2007__StLaurent_1" 
                        | Source_ID_Study_number  == "VK1_2007__StLaurent_3" )

install.packages("tidyr") # needed for 'unite' function
library(tidyr) 

#Genus variable and Species variable are combined into one new variable
GenusSpeciesFrag <- unite(B_F_A_S_TenSitesFrag,Genus_Species, Genus, Species, sep = " ") 

#Removing any double species names
GSF_Unique <- unique(GenusSpeciesFrag$Genus_Species)

#calculating amount of species
summary(GSF_Unique) # = 648 species

#Used in Acces to connect the mean species body weight with the species from the PREDICTS studies
#Stored in Bachelorproject\Acces_Body_Size\Input_From_R

write.csv(GSF_Unique, file = "C:/Users/F/Desktop/GSF_Unique.csv", row.names = FALSE)