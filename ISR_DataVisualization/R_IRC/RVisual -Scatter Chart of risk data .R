data1<-read.csv("C:/Users/hwang/Desktop/data.csv")
if(!require('ggplot2')) install.packages('ggplot2')
library(ggplot2)
options(scipen = 999)
p6 <- ggplot(data1) +
  geom_point(aes(x = Market_Value, y = Standalone_Absolute_VaR, color = Description, size = Contribution_Absolute_VaR))+scale_size_continuous(range = c(0.5, 16))
p6
