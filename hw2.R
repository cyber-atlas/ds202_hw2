
#Loads the data
mpg
#Shows the data
str(mpg)

#1
#Save the mpg table as a dataframe
mpgDF <- data.frame(mpg)
head(mpgDF)

#Sorts the mpg data frame by the hwy value
#Because it sorts in ascending order, we reversed that with a -
sortedList<- mpgDF[order(-mpg$hwy),]
#Makes a data frame with the values at the top of sorted list
top3 <- head(sortedList, 3)
#print the dataframe
print(top3)

top3

#2
#The reason you need a comma is because it does not know if you are specifying rows or columns
#After the comma, specifies what other columns to return. Not specified = all of them
noRepeats <- mpgDF[mpgDF$class == 'compact',]
print(noRepeats)
#Removes duplicate compact models
noDupes <- unique(noRepeats$model)
#class(noDupes)
#Makes noDupes a data frame
noDupes <- data.frame(noDupes)
str(noDupes)
print(noDupes)
#class(noDupes)
#Variable to store the number of different compact car models 
numCompact <- length(noDupes)
#Prints the number of compact cars on the list
print(numCompact)

#3.
#Grab all of the hwy values by selecting the column in the dataframe
hwy <- data.frame(mpgDF$hwy)
hwy
#Grab all of the cty values by selecting teh column in the dataframe
cty <- data.frame(mpgDF$cty)
cty

#More ggplot stuff 
#http://www.sthda.com/english/wiki/ggplot2-title-main-axis-and-legend-titles
#Uses ggplot2 to make a scatterplot with 
ggplot(mpgDF, aes(x=hwy, y=cty)) +
  geom_point(shape=1) + 
  geom_smooth(method=lm,
              se=FALSE) +
  ggtitle("Hwy by cty")
#As the hwy increases, the city is increases more slowly than hwy


#Grabs each column and puts them in a dataframe saved in carsByYear
cars1999 <- mpgDF[mpgDF$year == 1999, c('year', 'cty', 'hwy') ]
# cars2008 <- mpgDF[mpgDF$year == 2008, ]
cars2008 <- mpgDF[mpgDF$year == 2008, c('year', 'cty',"hwy")]
#carsByYear <- data.frame(mpgDF$year == 1999, mpgDF$cty, mpgDF$hwy)
#carsByYear <- subset(mpgDF, year == '1999', select=c('year', 'cty', 'hwy'))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cty, y = hwy, color = year))

#TODO make a box and whisker plot for each of the 2 datasets
boxplot(cty~year, data=mpgDF, main="City mpg", xlab = "Year", ylab = "Miles Per Gallon" )
boxplot(hwy~year, data=mpgDF, main="Highway mpg", xlab = "Year", ylab = "Miles Per Gallon")

sprintf("1999 Highway Mean:  %f", mean(cars1999[,"hwy"]))
sprintf("1999 City Mean:  %f", mean(cars1999[,"cty"]))
sprintf("2008 Highway Mean:  %f", mean(cars2008[,"hwy"]))
sprintf("2008 City Mean:  %f", mean(cars2008[,"cty"]))
ctyMean1999 <- mean(cars1999[,"cty",])
means1999
?print
               