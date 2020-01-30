
setwd("//bcimcs2/exie$/Documents/Data Visualization/Stack Column & Line Chart")
my_palette = c("#DC642B",  "#00365B", "#696F78", "#4A317E", "#FFFF00",
               "#00ABBD",  "#FDB736", "#C0CAAB")
#loading packages
if(!require("ggplot2")) install.packages("ggplot2")
if(!require("gtable")) install.packages("gtable")
if(!require("grid")) install.packages("grid")

library(ggplot2)
library(gtable)
library(grid)

BarLineChart <- function(plot.data.bar, plot.data.line, barName, lineName, lineLegend) {
  
  theme <- theme_minimal() +
    theme(panel.grid.major = element_blank())+
    theme(axis.title.x=element_blank()) +
    theme(legend.position="bottom") + 
    theme(legend.title = element_blank())
  
  ggplot() +
    geom_bar(data = plot.data.bar, width=0.5,
             aes(x = xAxis, y = barValue, fill = variable), 
             stat="identity") +
    scale_fill_manual(values = my_palette) +
    geom_line(data = plot.data.line, alpha = 0.5, size = 1.2,
              aes(x = xAxis, y = (lineValue - 0.1) * 20, group = lineLegend, 
                  col = lineLegend)) +
    scale_color_manual(values="black") +
    geom_point(data = plot.data.line, alpha = 0.5,size = 2,
               aes(x = xAxis, y = (lineValue - 0.1) * 20)) +
    scale_y_continuous(barName, labels = scales::percent,
                       sec.axis = sec_axis(~ . / 20 + 0.1, labels = scales::percent, lineName)) +
    theme 
  
}

dataset <- read.csv("Data - RVisual - Stack Column and Line Chart.csv")

xAxis <- dataset$RiskDate
xAxis <- as.Date(xAxis, format = "%m/%d/%Y")
xAxis <- as.factor(xAxis)
#xAxis <- factor(xAxis, levels = c("12/31/2016", "03/31/2017", "06/30/2017", "09/30/2017", "12/31/2017", "03/31/2018"))
variable <- dataset$Description
variable <- factor(variable, levels = levels(variable)[c(6:9, 1:5)])
barValue <- dataset$Contribution_Absolute_VaR_...
lineValue <- -dataset$Standalone_Absolute_VaR_...

plot.data.bar <- data.frame(xAxis = xAxis,
                            variable = variable,
                            barValue = barValue)
plot.data.bar <- data.frame(xAxis = xAxis,
                            variable = variable,
                            barValue = barValue)
plot.data.bar <- plot.data.bar[variable != "BC IMC Total Plan", ]

plot.data.line <- data.frame(xAxis = xAxis ,
                             variable = variable,
                             lineValue = lineValue)
plot.data.line <- plot.data.line[variable == "BC IMC Total Plan", ]

barName <- "Risk Contribution (%)"
lineName <- "Market Risk (%)"
lineLegend <- "Total VaR"

p <- BarLineChart(plot.data.bar, plot.data.line, barName, lineName, lineLegend) 
print(p)
