#This script uses a data.frame from the script "6._Species_Acces_Edge" 
#Therefore, to run this script "5._Species_Acces_HF" needs to be ran first. 

library(dplyr)
library(plyr)
library(tidyr)

Frag_BM_Abundance <-read.table("C:/Users/F/Desktop/Uva/Bachelor Project All/Bachelorproject/Acces_Body_Size/Output_From_Acces/F_BM_Abundance.txt",
                               header=T,sep=";",
                               fill=TRUE,
                               row.names = NULL,
                               dec = ",") 
str(Frag_BM_Abundance)
ExtractedSites <-read.table("C:/Users/F/Desktop/Uva/Bachelor Project All/Bachelorproject/ArcGIS/Export/CD_U_E_ImportReady.txt",
                            header=T,sep=",",
                            fill=TRUE,
                            row.names = NULL)

str(ExtractedSites)
#RASTERVALU represents Core_Area_Index and will be called that way
colnames(ExtractedSites)[colnames(ExtractedSites)=="RASTERVALU"] <- "Core_Area_Index"

# DL1_2013__deThoisy_1 contains one species and  will be removed! 
# VK1_2007__StLaurent_1 also only contains one species and will be removed
# Notice that this is not the case forVK1_2007__StLaurent_3 which is named "StLaurent" in the final report



F_BM_A_RemovedStudy <- filter(Frag_BM_Abundance, 
                              !grepl('DL1_2013__deThoisy_1|VK1_2007__StLaurent_1', Source_ID_Study_number))

F_BM_A_RemovedStudy$Km_to_nearest_edge_of_habitat <- NULL 


#Remove sites with less than three species
ThreeSitesTest_HF <- filter(F_BM_A_RemovedStudy,Measurement != "0")
tt4 <- table(ThreeSitesTest_HF$SSBS)
TST_FilteredHF <- subset(ThreeSitesTest_HF, SSBS %in% names(tt4[tt4 >= 3]))

#removing studies with less than 10 sites remaining after sites with less than 3 different species are removed
tt5 <- table(TST_FilteredHF$Source_ID_Study_number)
F_BM_A_RM_TenSites <- subset(TST_FilteredHF, Source_ID_Study_number %in% names(tt5[tt5 >= 10]))

n_distinct(F_BM_A_RemovedStudy$Source_ID_Study_number) # = 11 different studies present before removing sites with less than three species counted
n_distinct(F_BM_A_RM_TenSites$Source_ID_Study_number) # = 10 studies remaining, so one study is removed (HW1_2008__Lantschner_1)

n_distinct(ThreeSitesTest_HF$SSBS)     # = 742 sites before removing sites with less than 3 different species counted.
n_distinct(F_BM_A_RM_TenSites$SSBS) # = 637 site after removing sites with less than 3 different species counted.
                            # 769-637 = 132 sites were removed

OnlyCMBMFrag  <- ddply(F_BM_A_RM_TenSites, .(SSBS),
                function(F_BM_A_RM_TenSites) data.frame(CMWBS=weighted.mean(x= F_BM_A_RM_TenSites$BM_Joined,w= F_BM_A_RM_TenSites$Effort_corrected_measurement)))

OnlyLogCMBMFrag  <- ddply(F_BM_A_RM_TenSites, .(SSBS),
                       function(F_BM_A_RM_TenSites) data.frame(LogCMWBS=weighted.mean(x= F_BM_A_RM_TenSites$LogBM_Joined,w= F_BM_A_RM_TenSites$Effort_corrected_measurement)))

F_BM_A_RS_Unique <- unique(F_BM_A_RM_TenSites[c("SSBS", 
                                   "Source_ID_Study_number",
                                   "Block",
                                   "Site_number",
                                   "Country",
                                   "Longitude",
                                   "Latitude",
                                   "Biome", 
                                   "Predominant_land_use",
                                   "Use_intensity"
                                   )])


CMBMFrag <- merge(OnlyCMBMFrag,F_BM_A_RS_Unique, by = c('SSBS'))
LogCMBMFrag <- merge(OnlyLogCMBMFrag,F_BM_A_RS_Unique, by = c('SSBS'))


#so the SSBS can be merged
ES_Unite <- unite(ExtractedSites, SSBS, Source_ID_Study_number, Block, Site_number, sep = "_")

ES_Unite$SSBS <- gsub(' ', '_', ES_Unite$SSBS)
CMBMFrag$SSBS <- gsub(' ', '_', CMBMFrag$SSBS)
LogCMBMFrag$SSBS <- gsub(' ', '_', LogCMBMFrag$SSBS)

ES_Unite$Km_to_nearest_edge_of_habitat <- NULL 

CMBM_HabitatFragmentation <- merge(CMBMFrag,ES_Unite, by = c('SSBS'))
LogCMBM_HabitatFragmentation <- merge(LogCMBMFrag,ES_Unite, by = c('SSBS'))

#Get the Core_Area_Index in front (left) of the data.frame
CMBM_HabitatFragmentation <- select(CMBM_HabitatFragmentation, 
                                   SSBS,
                                   CMWBS,
                                   Core_Area_Index,
                                   Source_ID_Study_number,
                                   SSBS,
                                   Block,
                                   Site_number,
                                   Site_name,
                                   Country,
                                   Longitude.y,
                                   Latitude.y,
                                   Biome, 
                                   Predominant_land_use,
                                   Use_intensity)
