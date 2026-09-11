
#load
library(readr)
library(arules)
library(arulesViz)

path<-"C:/Users/Johnnel/Desktop/TIP folder/2nd year 1st sem/business intellegence/W8/archive/market.csv"

market <- read.csv(path, sep = ";") 

#check
View(market)
str(market)
head(market)

colSums(is.na(market))	#df.isna().sum()
sum(duplicated(market)) 	#df.duplicated().sum()

library(arules)

#conversion to transactions for arules
mart <- as(market ==1, "transactions") 
summary(mart)

#Item Frequency
min_support <- 0.2

#Plotting Frequency

#by distribution/ portion
itemFrequencyPlot(mart,
                  support = min_support,
                  type = "relative", #<-show as distribution/portion
                  main = "Item Frequency Distribution at 0.2 support")
                  
#top 10
itemFrequencyPlot(mart,
                  support = min_support,
                  type = "relative",
                  topN = 10, #<-shows only top 10
                  main = "Top 10 Item Frequenc at 0.2 support")
                  

#top 3:banana(0.44), cheese(0.43), bacon(0.42)

#last 10 
sort_asc<- sort(itemFrequency(mart, type = "relative")) #sort is in asc order by default

itemFrequencyPlot(mart[, names(sort_asc)[1:10]],
                  type = "relative", #works to w/ "absolute" make sure same w/ your sorter
                  main = "10 Least Frequent Items at 0.2 support")

#bottom 3:shampoo(0.36), sugar(0.36), milk(0.37)

#Types of Association Rules
#Apriori
rules <- apriori(mart,
                 parameter = list(
                   supp = 0.2,
                   conf = 0.5,
                   minlen = 2,
                   maxlen = 3))
length(rules)
inspect(rules)

#check
inspect(rules[1:5]) #first 5
inspect(rules[(length(rules)-4):length(rules)]) #last 5

inspect(sort(rules, by = "support", decreasing = TRUE)[1:5]) #by support
inspect(sort(rules, by = "confidence", decreasing = TRUE)[1:5]) #by confidence
inspect(sort(rules, by = "lift", decreasing = TRUE)[1:5]) #by lift

#highest support: bacon->banana s=0.2414
#bacon-banana occurs 24.14% of all the transactions

#highest confidence: butter->cheese c=0.5747
#transactions of butter has 57.47% of likelihood of getting cheese 

#highest lift: milk->heavycream l=1.3418
#milk buyers often is 1.34 times more likely to buy heavycream

#Types of Plotting (Arules)
#scatter plot-how strong are the rules?
#support = how common?
#confidence = how often?
#lift = how strong the association?
plot(rules,
     method = "scatter",
     shading = "lift", #choose: support, confidence or lift (lift gives additional detail) 
     control = list(jitter = 0))

#graph-what's their relationship
plot(rules,
     method = "graph",
     engine = "igraph")

#for top 10 lift only -for clearer analysis
top_rules <- head(sort(rules, by = "lift"), 10) #sorting top 10

plot(top_rules,
     method = "graph",
     engine = "igraph")

#Specific Plot
#antecedent rules-What is related to the Antecedent(milk)?
antecedent_rules <- subset(rules, subset = lhs %in% "Milk")  #lhs for antecedent
inspect(antecedent_rules)

plot(antecedent_rules,
     method = "graph",
     engine = "igraph")


#consequent rules-what leads to the consequent(heavy cream)
consequent_rules <- subset(rules, subset = rhs %in% "HeavyCream") #rhs for consequent
inspect(consequent_rules)

plot(consequent_rules,
     method = "graph",
     engine = "igraph")

 
