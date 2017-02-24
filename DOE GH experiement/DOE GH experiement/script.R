# pakage 
library(ggplot2)
# import data
doe_df <- read.csv(file = "C:/Users/fadji_000/AppData/Local/Temp/Prejet serre DOE.csv.utf8", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ";", dec = ".", quote = "\"", comment.char = "")


# convert natural variable to coded variable

## Outdoor=-1 tap=1
levels(doe_df$water)[1] <- -1
levels(doe_df$water)[2] <- 1

## no =-1 yes=1
levels(doe_df$fertilizer)[1] <- -1
levels(doe_df$fertilizer)[2] <- 1

## artificial =-1 natural=1
levels(doe_df$light)[1] <- -1
levels(doe_df$light)[2] <- 1

#Separate two population of the data set 
catnipDoe_df <- subset(doe_df, plant == "Catnip")
fennelDoe_df <- subset(doe_df, plant == "Fennel")

#apply anova to each subset
#Fenouille

#catnipDoe_aov2 <- anova(lm(as.double(result) ~ light + Eau + Engrais + Lumiere:Engrais + Engrais:Eau + Lumiere:Eau + Lumiere:Eau:Engrais, data = catnipDoe_df))
#print(aov2_expSerreFenouille)

