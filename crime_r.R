# Import data
library(readxl)
library(qplot)
database <- read_excel("~/GitHub/Kaggle_cp/crimeds.xls")

#Process of subsecting data, based on values of 3 variables:

crimeds <- database[which(database$'Victim Count' > 0),]
teste2 <- crimeds[which(crimeds$`Perpetrator Age`>4),]
teste3 <- teste2[which(teste2$`Victim Age`>0),]
crimeds<- teste3
write.csv(crimeds, file= "crimeds.csv", row.names = F)

#Describing Data 
summary(crimeds$`Perpetrator Age`)
summary(crimeds$`Victim Age`)
boxplot(crimeds$`Victim Age`)

##Solving the Victims Age Problem

#We found some outliers here. Max value= 998? Lets clean this!
crimedsteste <- crimeds[which(crimeds$`Victim Age` <110),]
#Lets check if there's any age above 110
sum(crimedsteste$`Victim Age` >110)
#or 99
sum(crimedsteste$`Victim Age` >99)
#Nop. Lets continue
#35318-35278 = we lost 40 outliers (victims with >110 years old)
crimeds <- crimedsteste
boxplot(crimeds)

#some plots about age 
VA <- crimeds$`Victim Age`
PA <- crimeds$`Perpetrator Age`
pairs(~VA+PA, data=crimeds, main="VA vs PA")

install.packages("scatterplot3d")
library(scatterplot3d)
attach(crimeds)
scatterplot3d(PA, VA, main="3D representation of PA vs VA")
#Histograms (for numeric data) and tables for categorical
hist(crimeds$Year)
hist(crimeds$`Victim Count`)
table(crimeds$Weapon)
#crimeds$Weapon attention to 1337 unknown.
table(crimeds$`Crime Solved`)
#No outliers
table(crimeds$State)
sum(crimeds$State == "Unknown")
#STATE:no unkwnown/outliers
table(crimeds$Month)
#MONTH:no unkwnown/outliers

#Crimes per Year - bars histogram -  hbar_year
qplot(crimeds$Year, geom="histogram", 
      binwidth=0.5,
      main= "Homicides by Year", 
      xlab = "Year",
      fill= I("grey"),
      alpha=I(1))

#Crimes per Year 2 - Density hist
ggplot(data=crimeds, aes(crimeds$Year)) + 
  geom_histogram(aes(y =..density..), 
                 breaks=seq(1,1, by = 1), 
                 col="red", 
                 fill="green", 
                 alpha=.4) + 
  geom_density(alpha=.2, fill="#FF6666") + 
  labs(title="Crimes by Year", x="Year", y="%")


## Crimes per year - Bars with labels
ggplot(data=crimeds, aes(crimeds$Year)) + 
  geom_histogram(aes(y =..count..), 
                 binwidth = 0.5, 
                 col="black", 
                 fill="black", 
                 alpha=.8) + 
  labs(title="Crimes by Year", x="Year", y="count") +
  stat_bin(binwidth=1, geom="text", colour="white", size=1.5,
           aes(label=..count..), position=position_stack(vjust=0.9))

##Crime per month. Any seasonal variation?
ggplot(data=crimeds, aes(crimeds$Month)) + 
  geom_bar(aes(y =..count..), 
                 #binwidth = 0.5, 
                 col="black", 
                 fill="black", 
                 alpha=.8) + 
  labs(title="Crimes by Month", x="Month", y="count")

<<<<<<< HEAD

library(ggplot2)
## Weapons without Unknown values

ggplot(data=Weapon2, aes(Weapon2$Weapon)) + 
  geom_bar(aes(y =..count..), 
           #binwidth = 0.5, 
           col="black", 
           fill="black", 
           alpha=.8) + 
  labs(title="Crimes by Weapon Used", x="Weapon", y="Count")

#Weapons by crime Type (absolute freq)
table(Weapon2$Weapon, Weapon2$`Crime Type`)
#Relative frequency of weapons used: 
weaponf = Weapon2$Weapon
weapon.freq=table(weaponf)
weapon.rel.freq = weapon.freq / nrow(crimeds)
sort(weapon.rel.freq, decreasing = TRUE)


=======
## Age difference between Perpretator and Victims
crimeds$AgeDifference = crimeds$`Perpetrator Age` - crimeds$`Victim Age`
qplot(crimeds$AgeDifference,binwidth=1)
           
>>>>>>> 15851344763fca6287e4097d7a2776f27b7b8d52
