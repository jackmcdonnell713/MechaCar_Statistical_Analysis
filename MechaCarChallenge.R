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
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarise(mean(PSI),median(PSI),var(PSI), sd(PSI), .groups = 'keep')

lot_summary


# First T-test for PSI difference
t.test(Suspension_Coil$PSI, mu = 1500)

#Help determining arguments from challenge page
?t.test()

#Using subset to determine if each lot is different from the mean
t.test(subset(Suspension_Coil,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)
t.test(subset(Suspension_Coil ,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)
t.test(subset(Suspension_Coil ,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)
