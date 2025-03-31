library(lsa)       
library(cluster)    
library(factoextra) 
library(dplyr)

df <- read.csv("scaled_features_df.csv")

numeric_data <- df[, -1]

cos_sim <- cosine(as.matrix(numeric_data))

dissimilarity_matrix <- as.dist(1 - cos_sim)

hc <- hclust(dissimilarity_matrix, method = "average")

plot(hc, main = "Hierarchical Clustering Dendrogram (Cosine Similarity)", 
     xlab = "", sub = "", cex = 0.6)

rect.hclust(hc, k =4, border = "red")





