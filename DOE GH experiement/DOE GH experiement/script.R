##### LOAD INFORMATION #####
# pakage 
library(ggplot2)
library(ggcorrplot)
# import data
doe_df <- read.csv(file = "C:/Users/fadji_000/AppData/Local/Temp/Projet serre DOE.csv.utf8", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ";", dec = ",", quote = "\"", comment.char = "")

#### DATA CLEANNING #############

#verify 
print(doe_df) 

# Verify the class of each column
sapply(doe_df, class)

# change class of column
doe_df$serie <- as.factor(doe_df$serie)
doe_df$position <- as.factor(doe_df$position)
doe_df$bloc <- as.factor(doe_df$bloc)

# Change column name result to height
names(doe_df)[names(doe_df) == 'result'] <- 'height'

#lowercase name Bloc
names(doe_df)[names(doe_df) == 'Bloc'] <- 'bloc'


#verify 
print(names(doe_df[8]))


# Convert to NA all 
for (i in 1:length(doe_df$height)) {
   if (doe_df$height[i]==0) {
      doe_df$height[i]<-NA
     }
}
#verify
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

####### ANALISYS #############

#apply anova to each subset
#catnip
catnipDoe_aov2 <- anova(lm(as.double(height) ~ light * water * fertilizer, data = catnipDoe_df))
print(catnipDoe_aov2)

#Fennel
fennelDoe_df <- anova(lm(as.double(height) ~ light * water * fertilizer, data = fennelDoe_df))
print(fennelDoe_df)

####### PLOT #############

ggplot(doe_df, aes(x = id, y = as.double(height), col = plant)) + geom_point(aes(shape = bloc)) + geom_smooth(na.rm = TRUE)

ggplot(doe_df, aes(x = id, y = as.double(height), col = plant)) + geom_boxplot()

