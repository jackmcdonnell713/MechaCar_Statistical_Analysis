#dependencies
library(dplyr)

#Read in MPG csv

MechaCar_mpg <- read_csv("MechaCar_mpg.csv")

#Create MLM regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar) 
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar)) 

#Read in suspension coil csv

Suspension_Coil <- read_csv("Suspension_Coil.csv")


#Total summary table creation
total_summary <- Suspension_Coil %>% summarise(mean(PSI), median(PSI), var(PSI), sd(PSI), .groups = 'keep')
                                             
total_summary

#Lot Summary table creation
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(mean(PSI),median(PSI),var(PSI), sd(PSI), .groups = 'keep')

lot_summary
