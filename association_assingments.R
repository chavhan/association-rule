#install.packages("arules")
library("arules")
#install.packages("arulesViz")
library("arulesViz")

## Arules for book dataset 
?apriori
View(book)
head(book)
arules <- apriori(as.matrix(book), parameter = list(support= 0.02, confidence = 0.7))
arules
summary(arules)
inspect(head(sort(arules,by="lift")))
plot(arules)
plotly_arules(arules)
plot(arules, method = "grouped")


## Groceries Association rules mapping 
#groceries_advance <- groceries
#groceries_advance <- groceries_advance[-1,]
#groceries_advance <- as(groceries_advance, 'transactions')
#head(groceries_advance)
#inspect(groceries_advance[1,])
data_groceries <- read.transactions('E:/data_scientist/ExcelR/assignment/assignment/associationRule/groceries.csv', format = c("basket", "single"), 
                          header = FALSE, sep = "", 
                          cols = NULL, rm.duplicates = FALSE, 
                          quote = "\"'", skip = 0, 
                          encoding = "unknown")
inspect(data_groceries[1,])
arules_grocery <- apriori(data_groceries,parameter = list(support=0.003,confidence=0.9))
summary(arules_grocery)
inspect(head(sort(arules_grocery,by="lift")))
plot(arules_grocery)
plotly_arules(arules_grocery)
plot(arules_grocery, method = "grouped")


## Storing different results altogether 
storeRest <- as.data.frame(
             'dataset' <- NULL,
             'support' <- NULL,
             'confidance' <- NULL,
             'max_lift' <- NULL,
             'rules' <- NULL
)
datasetName <- 'my_movies'
supprotVal <- 0.05
confidanceVal <- 0.9
maxlift <- 10
ruleVal <- 74
insData <- data.frame(datasetName,supprotVal,confidanceVal,maxlift,ruleVal)
names(insData) <- c('dataset','support','confidance','max_lift','rules')
storeRest <- rbind(storeRest,insData)
View(storeRest) 

## my_movies arules observation 
dim(my_movies)
movies <- my_movies[,6:15]
head(movies)
arules_movie <- apriori(as.matrix(movies),parameter = list(support=0.05,confidence=0.9))
summary(arules_movie)
inspect(head(sort(arules_movie,by='lift')))
plot(arules_movie,method = 'grouped')
plot(arules_movie)

