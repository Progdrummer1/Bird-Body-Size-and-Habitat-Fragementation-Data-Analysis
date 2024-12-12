install.packages("ez")
install.packages('dplyr')
install.packages("tidyr")
library('dplyr') #is needed for 'select()' function
library('tidyr') #is needed for 'unite()' function

##import data
setwd("C:/Users/Frank/Documents/Bachelorproject/PREDICTS_Database")

RawPREDICTS <- readRDS("database.RDS", refhook = NULL) # select database.RDS

##export to CSV
write.csv(RawPREDICTS, "PREDICTS_Database_csv.csv", row.names = FALSE)

##selecting useful columbs (so a smaller (in file size) data.frame can be used )
##(SSBS ="Concatenation of Source_ID, Study_number, Block and Site_number.)

RP_StandardInfo <- select(RawPREDICTS, 
                         Source_ID, 
                         Km_to_nearest_edge_of_habitat,
                         SSBS,
                         Site_name,
                         Study_number,
                         Block,
                         Site_number,
                         Country,
                         Coordinates_method,
                         Longitude,
                         Latitude,
                         Diversity_metric_type, 
                         Habitat_as_described, 
                         Biome, 
                         Predominant_land_use, 
                         Rank, 
                         Family,
                         Genus,
                         Species, 
                         Class, 
                         Use_intensity, 
                         Measurement, 
                         Effort_corrected_measurement,
                         Habitat_as_described
                         )

#join Source_ID and Study_number to find studies
RP_SI_Unite <- unite(RP_StandardInfo, Source_ID_Study_number, Source_ID, Study_number, sep ="_" )

#Selecting for bird data
Birds <- filter(RP_SI_Unite, Class == "Aves")

#Selecting for areas which could contain forest

# Predominant_land_use
#    Use this ones:
#    Primary vegetation
#    Young secondary vegetation
#    Intermediate secondary vegetation
#    Mature secondary vegetation
#    Secondary vegetation (indeterminate age)
#    Plantation forest
#    Cannot decide

#    Filter these ones out:
#    Pasture
#    Cropland
#    Urban

#f = forest
B_Forest <- filter(Birds, Predominant_land_use == "Primary vegetation" | 
                       Predominant_land_use == "Young secondary vegetation"|
                       Predominant_land_use == "Intermediate secondary vegetation" |
                       Predominant_land_use == "Mature secondary vegetation" | 
                       Predominant_land_use == "Secondary vegetation (indeterminate age)"|
                       Predominant_land_use == "Plantation forest" |
                       Predominant_land_use == "Cannot decide" )

#filtering for abundance only
B_F_Abundance <- filter(B_Forest, Diversity_metric_type == "Abundance")

#research has been done on Species level
B_F_A_Species <- filter(B_F_Abundance, Rank == "Species")
levels(B_F_A_Species)

#amount of studies of birds which measured abundance within forests
n_distinct(B_F_A_Species$Source_ID_Study_number) # = 84

#amount of sites of birds which measured abundance within forests on species level
n_distinct(B_F_A_Species$SSBS) # = 3215

