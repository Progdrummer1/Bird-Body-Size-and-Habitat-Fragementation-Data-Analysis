#This script uses a data.frame from the script "1._Selecting_Studies".
#Therefore, to run this script "1._Selecting_Studies" needs to be ran first.

install.packages("xlsx")
install.packages('rJava')
library('xlsx')
library('tidyr')
library('dplyr')

#Selecting data
CoordinatesDetails <- select(B_F_A_Species, 
                    Source_ID_Study_number, 
                    Km_to_nearest_edge_of_habitat,
                    Site_name,
                    Block,
                    Site_number,
                    Longitude,
                    Latitude)

#removing multiple data for a single site
CD_Unique <- unique(CoordinatesDetails[c("Source_ID_Study_number", 
                                       "Km_to_nearest_edge_of_habitat",
                                       "Site_name",
                                       "Block",
                                       "Site_number",
                                       "Longitude",
                                       "Latitude" )])

#exporting data to be used in ArcGIS 
#stored in Bachelorproject\ArcGIS\Import\Coordinates

write.xlsx(CD_Unique, "C:/Users/F/Desktop/CD_Unique.xlsx",
           sheetName="CD_Unique",
           row.names = FALSE)