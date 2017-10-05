crimeds <- database[which(database$'Victim Count' > 0),]
teste2 <- crimeds[which(crimeds$`Perpetrator Sex`>4)]
teste2 <- crimeds[which(crimeds$`Perpetrator Sex`>4),]
teste2 <- crimeds[which(crimeds$`Perpetrator Age`>4),]
teste3 <- teste2[which(crimeds$`Victim Age`>0),]
teste3 <- teste2[which(teste2$`Victim Age`>0),]
crimeds<- teste3
write.csv
help("write.csv")
write.csv(crimeds, file= "crimeds", row.names = F)
write.csv(crimeds, file= "crimeds.csv", row.names = F)
