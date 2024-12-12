library(dplyr)

ExtractedSites <-read.table("C:/Users/F/Desktop/Uva/Bachelor Project All/Bachelorproject/ArcGIS/Export/CD_U_E_ImportReady.txt",
                                header=T,sep=",",
                                fill=TRUE,
                                row.names = NULL)

#RASTERVALU represents Core_Area_Index and will be called that way
colnames(ExtractedSites)[colnames(ExtractedSites)=="RASTERVALU"] <- "Core_Area_Index"

#within studies, one unique CAI value per study 
ES_Unique <-  distinct(ExtractedSites, Source_ID_Study_number, Core_Area_Index, .keep_all = TRUE)

#removing studies with less than x (10) sites remaining
tt2 <- table(ES_Unique$Source_ID_Study_number)

ES_U_TenSites <- subset(ES_Unique, Source_ID_Study_number %in% names(tt2[tt2 >= 10]))

#Amount of studies left
n_distinct(ES_U_TenSites$Source_ID_Study_number) 
# 13 studies left with minimal 10 sites. 
# 15 studies left with minimal 9 sites.
# 19 studies left with minimal 8 sites.

#Original amount of studies
n_distinct(ExtractedSites$Source_ID_Study_number) #  = 84
