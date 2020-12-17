library(tidyverse)
library(data.table)

songs <- fread("data/song_data.csv")
song_info <- fread("data/song_info.csv")


wide_range <- c("song_duration_ms","tempo","loudness")

songs %>% select(-wide_range) %>% 
  pivot_longer(cols = c(-1,-2)) %>% 
  ggplot() + 
    geom_histogram(aes(x = value),bins = 30)+
    facet_wrap(~name)
                                              
songs %>% select(c(1,2,wide_range[-1])) %>% 
  pivot_longer(cols = c(-1,-2)) %>% 
  ggplot() + 
  geom_histogram(aes(x = value),bins = 30)+
  facet_wrap(~name)


# Comparison Chart
model <- c("kNN","kNN(GS)","Decision Tree","Decision Tree(GS)","Bagging","Random Forest")
scores <- c(81.63,87.11,85.99,86.66,92.50,93.98)

comp <- data.frame(model = model, score = scores)

comp %>% ggplot(aes(x = fct_reorder(model,score), y = score)) + 
  geom_bar(stat = 'identity',fill = '#4444dd') +
  coord_flip() +
  labs(title = "Model Accuracy Comparisons (GS = 'Grid Search')",
       y = "% Accuracy",
       x = 'Model')
# Comparison Chart


df <- songs %>% mutate(is_pop = ifelse(song_popularity >=72,1,0))

df %>% ggplot(aes(x = tempo))+
  geom_histogram() +
  facet_wrap(~is_pop)


