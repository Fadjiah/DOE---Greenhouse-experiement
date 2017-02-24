# pakage 
library(ggplot2)
# import data
doe_df <- read.csv(file = "C:/Users/fadji_000/AppData/Local/Temp/Projet serre DOE.csv.utf8", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ";", dec = ",", quote = "\"", comment.char = "")

# Verify the class of each column
lapply(doe_df,class)


# Convert to NA all 
for (i in 1:length(doe_df$result)) {
   if (doe_df$result[i]==0) {
      doe_df$result[i]<-NA
     }
}

print(doe_df)

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
#catnip
lm(doe_df$result)

catnipDoe_aov2 <- anova(lm(result) ~ light*water*fertilizer, data = catnipDoe_df)
print(catnipDoe_aov2)

#Fennel
fennelDoe_df <- anova(lm(as.double(result) ~ light * water * fertilizer, data = fennelDoe_df))
print(fennelDoe_df)


ggplot(doe_df, aes(x = id, y = as.double(result), col = plant)) + geom_point()+geom_smooth()

