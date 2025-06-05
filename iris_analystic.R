library(tidyverse)
data(iris)

glimpse(iris)
summary(iris)
anyNA(iris)

iris %>% 
  group_by(Species) %>% 
  summarise(across(everything(), list(mean = mean, median = median, sd = sd)))

cor_matrix <- cor(iris %>% select(-Species))
round(cor_matrix, 2)

library(reshape2)
melted_cor <- melt(cor_matrix)
ggplot(melted_cor, aes(Var1, Var2, fill=value)) +
  geom_tile() +
  scale_fill_gradient2()


ggplot(iris, aes(x=Sepal.Length, fill=Species)) +
  geom_histogram(binwidth=0.3, alpha=0.6, position="identity")

ggplot(iris, aes(x=Species, y=Petal.Width, fill=Species)) +
  geom_boxplot()

ggplot(iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) +
  geom_point(size=3, alpha=0.7)


