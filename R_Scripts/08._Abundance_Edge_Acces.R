#This script uses a data.frame from the script "6._Species_Acces_Edge" 
#Therefore, to run this script "5._Species_Acces_HF" needs to be ran first. 
library(dplyr)

#remove sites without Edge values (within the selected studies which contain at least 10 sites with edge disance data)
GSE_NoNA <- filter(GenusSpeciesEdge, Km_to_nearest_edge_of_habitat != "NA")

#Will be used in Acces to connect the abundance with the mean species body weight.
#Stored in Bachelorproject\Acces_Body_Size\Input_From_R

write.table(GSE_NoNA, file = "C:/Users/F/Desktop/GenusSpeciesEdgeAbundance.txt",sep=";",dec = ",", row.names = FALSE)
