if(!require('ggplot2')) install.packages('ggplot2')
if(!require('scales')) install.packages('scales')
library(ggplot2)
library(scales)

######################################################
######       Waterfall Chart Function         ########
######################################################

# axis: a vector of text for which the Waterfall axis is desired
# value: a vector of values for which the Waterfall is desired

WaterfallChart <- function (axis, value) {
  
  percenForm <- sum(grepl("%", value)) > 0
  commaForm <- sum(grepl(",", value)) > 0

  # check if value is in % format
  if (percenForm) {
    value <- as.numeric(gsub("%", "", value))/100 
  }
  # check if value is in number (,) format
  if (commaForm) {
    value <- as.numeric(gsub(",", "", value))
  }
  
  #plotdata
  xAxis <- factor(axis, levels=c(levels(axis), "Total"))
  xAxis[length(xAxis) + 1] <- "Total"
  #set factor order
  xAxis <- factor(xAxis, levels = xAxis[1:length(xAxis)])
  plotdata <- data.frame(axis = xAxis)
  plotdata$type <- c(ifelse(value > 0, "Increase", "Decrease"), "Total")
  plotdata$type <- factor(plotdata$type, levels = c("Increase", "Decrease", "Total"))
  plotdata$start <- c(0, cumsum(value))
  plotdata$end <- c(cumsum(value), 0)
  plotdata$id <- 1:nrow(plotdata)
  plotdata$labelPos <- apply(plotdata[, c("start", "end")], 1, max )
  # value
  # check if value is in % format
  value <- c(value, sum(value))
  if (percenForm) {
    plotdata$value <- paste(value*100,"%",sep="")
  }
  
  
  ggplot(plotdata, aes(fill = type)) +
    geom_rect(aes(x = xAxis, xmin = id - 0.45, xmax = id + 0.45, ymin = end, ymax = start, fill = type)) +
    scale_fill_manual(labels= c("Increase", "Decrease", "Total"),
                      values=c("springgreen3", "brown2", "cyan3"),
                      drop = FALSE) +
    geom_text(data = plotdata, 
              aes(id, labelPos, label = comma(value), vjust = -0.3),alpha = 0.6) +
    scale_y_continuous(labels = comma)+
    theme(legend.title=element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          axis.ticks.x=element_blank())
}

dataset <- read.csv("Provincial Exposures Data.csv")
colnames(dataset) <- c("Province", "issueRate", "debtIssue")

WaterfallChart(dataset$Province, dataset$issueRate)
WaterfallChart(dataset$Province, dataset$debtIssue)

dataset$debtIssueRate <- as.numeric(gsub(",", "", dataset$debtIssue))
dataset$debtIssueRate <- dataset$debtIssueRate/sum(dataset$debtIssueRate)
dataset$debtIssueRate <- paste(round(dataset$debtIssueRate * 100, 2), "%", sep = "")
WaterfallChart(dataset$Province, dataset$debtIssueRate)
