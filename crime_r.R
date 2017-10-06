# Import data
library(readxl)
library(qplot)
database <- read_excel("~/GitHub/Kaggle_cp/crimeds.xls")

#Process of subsecting data, based on values of 3 variables:

crimeds <- database[which(database$'Victim Count' > 0),]
teste2 <- crimeds[which(crimeds$`Perpetrator Sex`>4)]
teste2 <- crimeds[which(crimeds$`Perpetrator Sex`>4),]
teste2 <- crimeds[which(crimeds$`Perpetrator Age`>4),]
teste3 <- teste2[which(crimeds$`Victim Age`>0),]
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

#Crimes per Year
qplot(crimeds$Year, geom="histogram", 
      binwidth=0.5,
      main= "Homicides by Year", 
      xlab = "Year",
      fill= I("grey"),
      alpha=I(1))

#Crimes per Year 2
ggplot(data=crimeds, aes(crimeds$Year)) + 
  geom_histogram(aes(y =..density..), 
                 breaks=seq(1,1, by = 1), 
                 col="red", 
                 fill="green", 
                 alpha=.4) + 
  geom_density(alpha=.2, fill="#FF6666") + 
  labs(title="Crimes by Year", x="Year", y="%")
