#This script uses a data.frame from the script "1._Selecting_Studies".
#Therefore, to run this script "1._Selecting_Studies" needs to be ran first.
library(dplyr)

#Selecting for studies contaning distance to nearest edge of habitat supporting high biodiversity values
ContainsEdge <- filter(B_F_A_Species, Km_to_nearest_edge_of_habitat != "NA")

#selecting for one value per site which are unique. 
CE_Unique <- unique(ContainsEdge[c("Source_ID_Study_number", 
                                         "Km_to_nearest_edge_of_habitat",
                                         "Site_name",
                                         "Block",
                                         "Site_number",
                                         "Longitude",
                                         "Latitude" )])

#Selecting for studies with at least 10 sites
tt3 <- table(CE_Unique$Source_ID_Study_number)
CE_U_TenSites <- subset(CE_Unique, Source_ID_Study_number %in% names(tt3[tt3 >= 10]))

print(tt3)

#amount of studies with at least 10 sites containing distance to edge
n_distinct(CE_U_TenSites$Source_ID_Study_number) # 13 studies left with at least 10 sites

#SC1_2011__Stouffer_1 as only one edge distance and will be removed.
#SE2_2013__Brandt_1 has three different edge distances for around 100 sites and will be removed.
