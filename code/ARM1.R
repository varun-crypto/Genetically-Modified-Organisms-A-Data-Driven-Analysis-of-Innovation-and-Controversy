library(arules)
library(arulesViz)

Foods <- read.transactions(
  "D:\\Text Mining\\transactions_data2.csv",
  format = "basket",
  sep = " ",
  cols = 1
)

inspect(Foods[1:5])


RulesAll <- apriori(
  Foods, 
  parameter = list(support = 0.01, confidence = 0.01, minlen = 2)
)


length(RulesAll)


SortedBySupport <- sort(RulesAll, by = "support", decreasing = TRUE)

inspect(SortedBySupport[1:15])

rules_by_confidence <- sort(RulesAll, by = "confidence", decreasing = TRUE)
cat("Top 15 rules by confidence:\n")
inspect(rules_by_confidence[1:15])

rules_by_lift <- sort(RulesAll, by = "lift", decreasing = TRUE)
cat("Top 15 rules by lift:\n")
inspect(rules_by_lift[1:15])

plot(SortedBySupport[1:15], method = "graph", engine = "htmlwidget")

plot(rules_by_confidence[1:15], method = "graph", engine = "htmlwidget")

plot(rules_by_lift[1:15], method = "graph", engine = "htmlwidget")




