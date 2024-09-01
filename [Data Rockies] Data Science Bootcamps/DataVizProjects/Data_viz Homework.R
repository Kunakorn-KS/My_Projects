install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

mtcars

new_mtcars <- mtcars %>%
                  mutate(am = factor(am,
                                     levels = c(0,1),
                                     labels = c("Manual","Auto")))
                
                        
                                         
new_mtcars 

diamonds

#Chart 1 (Histogram)
diamonds %>%
  ggplot(aes(depth, fill = color)) + geom_histogram(alpha = 0.5,position = "dodge")

#Chart 2 (Scatter plot)
new_mtcars %>%
  ggplot(aes(hp,mpg, )) + geom_point(pch = 16, col = "red",size = 5) + geom_smooth(fill = "blue",se = FALSE) 

#Chart 3 (Bar plot)
diamonds %>%
  ggplot(aes(color,fill = clarity)) + geom_bar(position = "fill")
   
#chart 4 (facet_grid)
set.seed(42)
ggplot(sample_n(diamonds, 2000), 
       aes(depth,price , color=clarity)) +
  geom_point(alpha=0.5) +
  geom_smooth(method = "lm" , se=F) +
  theme_classic() + 
  facet_grid(clarity ~ color)

#ลองทำเป็น bar chart ลองดูได้
set.seed(42)
ggplot(sample_n(diamonds, 2000), 
       aes(clarity, fill=cut)) +
  geom_bar(alpha=0.5,position = "Fill") +
  theme_classic() + 
  facet_grid(clarity ~ color)

#chart 5 (Box plot)
diamonds %>%
  ggplot(aes(carat,price))+ geom_boxplot()
  
                                                                        
