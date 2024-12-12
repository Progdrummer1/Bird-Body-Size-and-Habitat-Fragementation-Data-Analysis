library(dplyr)
library(plyr)
library(tidyr)

Edge_BM_Abundance <-read.table("C:/Users/F/Desktop/Uva/Bachelor Project All/Bachelorproject/Acces_Body_Size/Output_From_Acces/Edge_BM_Abundance1_Import1.txt",
                               header=T,sep=";",
                               fill=TRUE,
                               row.names = NULL,
                               dec = ",") 
str(Edge_BM_Abundance)

#Remove sites with less than three species
ThreeSitesTest_Edge <- filter(Edge_BM_Abundance ,Measurement != "0")
tt5 <- table(ThreeSitesTest_Edge$SSBS)
TST_FilteredEdge <- subset(ThreeSitesTest_Edge, SSBS %in% names(tt5[tt5 >= 3]))

#removing studies with less than 10 sites remaining after sites with less than 3 different species are removed
tt5 <- table(TST_FilteredEdge$Source_ID_Study_number)
E_BM_A_TenSites <- subset(TST_FilteredEdge, Source_ID_Study_number %in% names(tt5[tt5 >= 10]))

n_distinct(Edge_BM_Abundance$Source_ID_Study_number) # = 11 different studies present
n_distinct(E_BM_A_TenSites$Source_ID_Study_number) # = 8 studies remaining, so three studies are is removed

n_distinct(Edge_BM_Abundance$SSBS)    # = 433 sites before removing sites with less than 3 different species counted.
n_distinct(E_BM_A_TenSites$SSBS)      # = 305 site after removing sites with less than 3 different species counted.
                               # 433-503 = 128 sites were removed

Edge_CMBM  <- ddply(E_BM_A_TenSites, .(SSBS),
               function(E_BM_A_TenSites) data.frame(CMWBS=weighted.mean(x= E_BM_A_TenSites$BM_Joined,w= E_BM_A_TenSites$Effort_corrected_measurement)))

#NaN = no abundance at the whole site, no individuals spotted
# Therefore the CWMBM is not known of the site and the sites are not useable.  

OnlyCMBMEdge  <- ddply(E_BM_A_TenSites, .(SSBS),   
                       function(E_BM_A_TenSites) data.frame(CMWBS=weighted.mean(x= E_BM_A_TenSites$BM_Joined,w= E_BM_A_TenSites$Effort_corrected_measurement)))

OnlyLogCMBMEdge  <- ddply(E_BM_A_TenSites, .(SSBS),   
                          function(E_BM_A_TenSites) data.frame(LogCMWBS=weighted.mean(x= E_BM_A_TenSites$LogBM_Joined,w= E_BM_A_TenSites$Effort_corrected_measurement)))

E_BM_A_RS_Unique <- unique(E_BM_A_TenSites[c("SSBS", 
                                                 "Source_ID_Study_number",
                                                 "Block",
                                                 "Site_number",
                                                 "Km_to_nearest_edge_of_habitat",
                                                 "Country",
                                                 "Longitude",
                                                 "Latitude",
                                                 "Biome", 
                                                 "Predominant_land_use",
                                                 "Use_intensity"
)])

CMBMEdge <- merge(OnlyCMBMEdge,E_BM_A_RS_Unique, by = c('SSBS'))
LogCMBMEdge <- merge(OnlyLogCMBMEdge,E_BM_A_RS_Unique, by = c('SSBS'))
