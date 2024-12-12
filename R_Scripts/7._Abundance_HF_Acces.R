#This script uses a data.frame from the script "5._Species_Acces_HF" 
#Therefore, to run this script "5._Species_Acces_HF" needs to be ran first. 

GenusSpeciesFrag$Habitat_as_described <- gsub(' \ ', ' ', GenusSpeciesFrag$Habitat_as_described)

### "\" in Habitat_as_describe  will be removed in Word because it gave some trouble when removing in R

#remove " " " 
GenusSpeciesFrag$Habitat_as_described <- gsub('"', ' ', GenusSpeciesFrag$Habitat_as_described)

#Humblotia flavirostris and Psittinus cyanurus contained no genus data. 
#These species appear in the studies "SC1_2005__Marsh_1" and "MH1_2010__Sheldon_1" respectively
#and will be removed from the GenusSpeciesFrag dataframe. 

GSF_DeleteSpecies <-  filter(GenusSpeciesFrag, 
                             !grepl('Humblotia flavirostris|Psittinus cyanurus', Genus_Species))

#Will be used in Acces to connect the abundance with the mean species body weight.
#Stored in Bachelorproject\Acces_Body_Size\Input_From_R

write.table(GSF_DeleteSpecies, file = "C:/Users/F/Desktop/GenusSpeciesFragAbundance.txt", dec = ",", sep = ';', row.names = FALSE)

