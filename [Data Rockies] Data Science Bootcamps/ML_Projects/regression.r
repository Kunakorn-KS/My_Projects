#build a regression model

library(caret)

data(mtcars)

train(mpg ~ hp+wt+am , 
      data = mtcars,
      method = "lm")
