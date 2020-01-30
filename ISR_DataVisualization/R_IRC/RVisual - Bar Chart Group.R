
d <- read.csv("Data - RVisual - Bar Chart Group.csv")

dataset <- d

#loading packages
if(!require('ggplot2')) install.packages('ggplot2')
if(!require('reshape')) install.packages('reshape')
if(!require('RColorBrewer')) install.packages('RColorBrewer')

library(ggplot2)
library(reshape)
library(RColorBrewer)

# check if value is in % format
# v: vector change to numerical format (form comma or % format)
toNumeric <- function (v) {
  
  percenForm <- sum(grepl("%", v)) > 0
  commaForm <- sum(grepl(",", v)) > 0
  
  if (percenForm) {
    v <- as.numeric(gsub("%", "", dataset$value))/100 
  }
  # check if value is in number (,) format
  if (commaForm) {
    v <- as.numeric(gsub(",", "", dataset$value))
  }
  
  v
  
}

# in % format

BarChartGroup <- function(dataset, barClass, rowClass, rowSubClass, colClass, percentage) {
  
  plot.data <- dataset[, c(rowClass, rowSubClass, barClass, colClass)]
  
  plot.data[, colClass] <- sapply(plot.data[, colClass], toNumeric)

  plot.data <- melt(plot.data, id.vars=c(rowClass, rowSubClass, barClass))
  
  colnames(plot.data) <- c("rowClass", "rowSubClass", "barClass", "colClass", "value")
  
  plot.data[, "colClass"] <- gsub("_", " ", plot.data[, "colClass"])
  
  if (percentage) {
    plot.data$label <- paste(round(plot.data$value * 100, 2), "%", sep = "")
  } else {
    plot.data$label <- round(plot.data$value * 100, 2)
  }
  
  
  theme <- theme_minimal() +
    theme(plot.title=element_blank()) +
    theme(axis.text.x=element_blank()) + 
    theme(axis.title=element_blank()) + 
    theme(legend.position="right") + 
    theme(legend.title = element_blank()) +
    theme(strip.placement = "outside") +
    theme(strip.text = element_text(size = 12))
  
  #p <- 
  # In order for position_dodge to work, there needs to be a reason to dodge.
  # https://stackoverflow.com/questions/29035707/r-ggplot-annotate-geom-text-with-position-dodge-and-facets
    ggplot(data = plot.data) +
      geom_bar(data = plot.data, aes(x = rowSubClass, y = value, 
                                   fill = barClass), 
               alpha = 0.8, position = "dodge", stat="identity") +
      geom_text(data = plot.data,
                aes(x=rowSubClass, 
                    y=value, 
                    label=label,
                    # add group to dodge
                    group = barClass,
                    hjust = ifelse(value > 0, -0.3, 1)), 
                position = position_dodge(width = 0.9), 
                size = 3, vjust="inward",hjust="inward") +
      facet_grid(rowClass ~ colClass, scale="free", space = "free_y", switch="y") +
      coord_flip() +
      scale_fill_manual(values = colorRampPalette(brewer.pal(9, "GnBu")[6:9])(nlevels(plot.data$barClass))) +
      theme 
}      
    


# data cleaning (col names)
colnames(dataset)[8] <- "Market_Value_Percentage"
colnames(dataset)[10] <- "Standalone_Absolute_VaR_Percentage"
colnames(dataset)[12] <- "Contribution_Absolute_VaR_Percentage"

barClass <- "RiskDate"
rowClass <- "MarketsType"
rowSubClass <- "Description"
colClass <- c("Market_Value_Percentage", "Standalone_Absolute_VaR_Percentage", "Contribution_Absolute_VaR_Percentage")

dataset$MarketsType <- factor(dataset$MarketsType, levels = levels(dataset$MarketsType)[3:1])

percentage <- T

BarChartGroup(dataset, barClass, rowClass, rowSubClass, colClass, percentage) 
  
      