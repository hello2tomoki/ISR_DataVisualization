
d <- read.csv("Data - RVisual - Column Chart Group.csv")
dataset <- d

#loading packages
if(!require('ggplot2')) install.packages('ggplot2')
if(!require('reshape')) install.packages('reshape')

library(ggplot2)
library(reshape)

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


newLinesAdder <- function(test.string, interval) {
  #split at spaces
  string.split <- strsplit(test.string," ")[[1]]
  # get length of snippets, add one for space
  lens <- nchar(string.split) + 1
  # now the trick: split the text into lines with
  # length of at most interval + 1 (including the spaces)
  lines <- cumsum(lens) %/% (interval + 1)
  # construct the lines
  test.lines <- tapply(string.split,lines,function(line)
    paste0(paste(line,collapse=" "),"\n"),simplify = TRUE)
  # put everything into a single string
  result <- paste(test.lines,collapse="")
  return(result)
}

addNewlines = function(x, interval) {
  
  # make sure, x is a character array   
  x = as.character(x)
  # apply splitter to each
  t = sapply(x, FUN = newLinesAdder, interval = interval,USE.NAMES=FALSE)
  return(t)
}

columnChartGroup <- function(Axis, colVar, legendName,Rating, Threshold) {
  
  plot.data <- cbind(AxisName, colVar, Rating)
  colnames(plot.data) <- c("AxisName", legendName, "Rating")
  plot.data[, legendName] <- sapply(plot.data[, legendName], toNumeric)
  AxisName <- plot.data$AxisName
  
  plot.data <- melt(plot.data, id.vars=c("AxisName", "Rating"))
  
  plot.data$AxisName <- paste(addNewlines(as.character(  plot.data$AxisName), 15), "(", Rating, ")" ) 
  
  
  
  theme <- theme_minimal() +
    theme(plot.title=element_blank()) +
    theme(axis.title=element_blank()) + 
    theme(legend.position="right") +
    theme(panel.grid.major.x = element_blank() )+
    #theme(panel.grid=element_blank()) +
    theme(legend.title = element_blank()) +
    theme(strip.text = element_text(size = 11))
  
  threshold <- data.frame(Rating=Rating, Threshold = Threshold)
  ann_text <- data.frame(Rating=Rating, pos = Threshold, 
                         text = paste("Threshold",paste("(", Rating, ")", sep = "")))
  ann_text$count <- rep(1, nrow(ann_text))
  ann_text <- merge(ann_text[, c("Rating", "pos", "text")], aggregate(count ~ Rating, data = ann_text, FUN = sum))
  ann_text$hjust <- -0.25 * ann_text$count
  
  threshold <- unique(threshold)
  ann_text <- unique(ann_text)
  
  
    ggplot(data = plot.data) +
    geom_bar(data = plot.data, aes(x = AxisName, y = value, 
                                   fill = variable), 
            position = "dodge", stat="identity") +
    scale_fill_brewer(palette = "Reds") +
    geom_hline(data = threshold, aes(yintercept = Threshold, col = "Thredshold"), size = 1) +
     # scale_color_brewer(palette = "Reds") +
      ylim(0, max(800, 1.1 * plot.data$value)) + 
    # annotation_custom(textGrob(ann_text$Rating), xmin = ann_text$Rating, xmax = ann_text$Rating, ymin = -Inf, ymax = Inf) +
    #geom_text(data = ann_text, aes(x = -Inf, y = pos, label = text, hjust="inward"), vjust = -1, alpha = 0.8) +
    facet_grid(~ Rating, scale="free", space = "free") +
      theme
}

dataset <- d
AxisName <- dataset$Axis
colVar <- dataset[, 2:4]
legendName <- c("Previous Month", "Previous Week", "04/27/2018")
Rating <- dataset$Rating
Rating <- factor(Rating, levels = levels(Rating)[c(4, 3, 1, 2)])
Threshold <- dataset$Threshold

columnChartGroup(Axis, colVar, legendName,Rating, Threshold)