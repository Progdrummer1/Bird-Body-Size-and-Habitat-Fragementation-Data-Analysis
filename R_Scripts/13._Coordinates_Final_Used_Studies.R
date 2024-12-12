#This script uses a data.frame from the script "2._Coordinates_ArcGIS".
#Therefore, to run this script "2._Coordinates_ArcGIS" needs to be ran first

#coordinates of used studies which were used in the end
CD_U_HFStudies <- filter(CD_Unique,
                         Source_ID_Study_number  == "DI1_2013__Azhar_1" 
                         | Source_ID_Study_number  == "DL1_2010__Proenca_2" 
                         | Source_ID_Study_number  == "DL1_2013__Bartolommei_1"  
                         | Source_ID_Study_number  == "HW1_2007__Chapman_1" 
                         | Source_ID_Study_number  == "MH1_2010__Sheldon_1" 
                         | Source_ID_Study_number  == "MH1_2011__Phalan_1" 
                         | Source_ID_Study_number  == "SC1_2005__Marsh_1" 
                         | Source_ID_Study_number  == "SC1_2010__ReyBenayas_1"  
                         | Source_ID_Study_number  == "SC2_2012__Santana_1"
                         | Source_ID_Study_number  == "VK1_2007__StLaurent_3" )

CD_U_EdgeStudies <- filter(CD_Unique,
                           Source_ID_Study_number    ==  "DI1_2011__Neuschulz_1"  
                           | Source_ID_Study_number  ==  "DL1_2009__Woinarski_1" 
                           | Source_ID_Study_number  ==  "DL1_2010__Proenca_2" 
                           | Source_ID_Study_number  ==  "DL1_2011__Mallari_1" 
                           | Source_ID_Study_number  ==  "DL1_2011__MorenoMateos_1" 
                           | Source_ID_Study_number  ==  "DL1_2012__Dallimer_1" 
                           | Source_ID_Study_number  ==  "DL1_2013__Bartolommei_1")

#exporting data
write.csv(CD_U_HFStudies, "C:/Users/F/Desktop/CD_U_HFStudies.csv",row.names = FALSE)
write.csv(CD_U_EdgeStudies, "C:/Users/F/Desktop/CD_U_EdgeStudies.csv", row.names = FALSE)

#moved to Bachelorproject\ArcGIS\Import\Coordinates and later interesected with world map. 
