CREATE PROCEDURE [Rpt].[GenerateChartBinary_MarketValueByRating] (@RiskDate DATE) AS
BEGIN

DECLARE @ReportId INT = 0;
DECLARE @ChartTitle VARCHAR(100)= '% Market Value by Rating';

--change risk date
DECLARE @ChartInputSource NVARCHAR(MAX) = N'SELECT * FROM Rpt.RatingMarketValue';

DECLARE @ChartBinary TABLE([binData] VARBINARY(MAX) NULL);
INSERT INTO @ChartBinary
EXEC [sp_execute_external_script]
     @language = N'R',
     @script = N'

#create a temporary file
image_file = tempfile();

#create a png graphic device
png(filename = image_file, width=1000, height=750); 

#loading packages
if(!require(''ggplot2'')) install.packages(''ggplot2'')
if(!require(''ggrepel'')) install.packages(''ggrepel'')
if(!require(''grid'')) install.packages(''grid'')
if(!require(''ggthemes'')) install.packages(''ggthemes'')
if(!require(''RColorBrewer'')) install.packages(''RColorBrewer'')

library(ggplot2)
library(ggrepel)
library(grid) 
library(ggthemes) 
library(RColorBrewer) 

colnames(dataset) <- c("key", "value", "Class")

percenForm <- sum(grepl("%", dataset$value)) > 0
commaForm <- sum(grepl(",", dataset$value)) > 0

# check if value is in % format
if (percenForm) {
  dataset$value <- as.numeric(gsub("%", "", dataset$value))/100 
}
# check if value is in number (,) format
if (commaForm) {
  dataset$value <- as.numeric(gsub(",", "", dataset$value))
}

n <- dim(dataset)[1]

d1 <- dataset[dataset$Class == "Investment Grade", ]
d2 <- dataset[dataset$Class == "High Yield", ]

d1.key <- factor(d1$key, levels=c("High Yield", levels(d1$key)))
d1.key[length(d1.key) + 1] <- "High Yield"
d1.key[2:length(d1.key)] <- d1.key[-length(d1.key)]
d1.key[1] <- "High Yield"

#set factor order
d1.key <- factor(d1.key, levels = d1.key[1:length(d1.key)])
d1.value <- c(sum(d2$value), d1$value)
d1 <- data.frame(key = d1.key, value = d1.value)
d1$percentage <- d1$value / sum(d1$value)
d1$text <- paste(round(100 * d1$value / sum(d1$value), 2), "%", sep = "")

d1$midPercen <- cumsum(c(0, d1$percentage[-length(d1$percentage)])) +
             d1$percentage / 2
offset1 <- 1/4 - d1$midPercen[1]
d1$midPercen <- d1$midPercen + offset1


d2$percentage <- d2$value / sum(d2$value)
d2$textPercen <- d2$value / (sum(dataset$value))
d2$key <- factor(d2$key, levels = d2$key[1:length(d2$key)])
d2$text <- paste(round(100 * d2$textPercen, 2), "%", sep = "")
d2$midPercen <- cumsum(c(0, d2$percentage[-length(d2$percentage)])) +
                   d2$percentage / 2

####=========== 
#   Function
####=========== 
# offset: percentage
funcCircleCoords <- function(center.x, center.y, r = 1, npoints = ncol(plot.data), offset = 0){
  tt <- seq(0,2*pi,length.out = npoints) + 2*pi*offset
  yy <- center.y + r * cos(tt)
  xx <- center.x + r * sin(tt)
  return(data.frame(x = xx, y = yy))
}

# pie chart

pie1 <- NULL
pixel <- 2^16
r1 <- 1
pie1 <- funcCircleCoords(0, 0, r1, pixel, offset1)
pie1$group <- c(rep(d1$key, pixel * d1$percentage),
                             rep(d1$key[length(d1$key)], 
                                 pixel - length(rep(d1$key, pixel * d1$percentage))))
pie1$group <- factor(pie1$group)

# index of new group
groupChangePos <- cumsum(floor(pixel * d1$percentage))
groupChangePos <- groupChangePos[-length(groupChangePos)] + 1

n1 <- dim(d1)[1]
pie1Sep <- NULL
pie1Sep <- pie1[c(1, groupChangePos+1),]
pie1SepC <- pie1Sep
pie1SepC$x <- 0
pie1SepC$y <- 0
pie1Sep <- rbind(pie1Sep, pie1SepC)

pie1$x[groupChangePos+1] <- pie1$x[groupChangePos]
pie1$y[groupChangePos+1] <- pie1$y[groupChangePos]
pie1$x[groupChangePos-2] <- pie1$x[groupChangePos]
pie1$y[groupChangePos-2] <- pie1$y[groupChangePos]
pie1$x[2] <- pie1$x[1]
pie1$y[2] <- pie1$y[1]
pie1$x[pixel-1] <- pie1$x[pixel]
pie1$y[pixel-1] <- pie1$y[pixel]

pie1$x[groupChangePos] <- 0
pie1$y[groupChangePos] <- 0
pie1$x[groupChangePos-1] <- 0
pie1$y[groupChangePos-1] <- 0
pie1$x[1] <- 0
pie1$y[1] <- 0
pie1$x[pixel] <- 0
pie1$y[pixel] <- 0

levels(pie1$group) <- levels(d1$key)

# other

pie2 <- NULL
c2 <- 2.5
r2 <- 0.5
pie2 <- funcCircleCoords(c2, 0, r2, pixel)
pie2$group <- c(rep(d2$key, pixel * d2$percentage),
                             rep(d2$key[length(d2$key)], 
                                 pixel - length(rep(d2$key, pixel * d2$percentage))))
pie2$group <- factor(pie2$group)

# index of new group
groupChangePos2 <- cumsum(floor(pixel * d2$percentage))
groupChangePos2 <- groupChangePos2[-length(groupChangePos2)] + 1

n2 <- dim(d2)[1]
pie2Sep <- NULL
pie2Sep <- pie2[c(1, groupChangePos2+1),]
pie2SepC <- pie2Sep
pie2SepC$x <- c2
pie2SepC$y <- 0
pie2Sep <- rbind(pie2Sep, pie2SepC)

pie2$x[groupChangePos2+1] <- pie2$x[groupChangePos2]
pie2$y[groupChangePos2+1] <- pie2$y[groupChangePos2]
pie2$x[groupChangePos2-2] <- pie2$x[groupChangePos2]
pie2$y[groupChangePos2-2] <- pie2$y[groupChangePos2]
pie2$x[2] <- pie2$x[1]
pie2$y[2] <- pie2$y[1]
pie2$x[pixel-1] <- pie2$x[pixel]
pie2$y[pixel-1] <- pie2$y[pixel]

pie2$x[groupChangePos2] <- c2
pie2$y[groupChangePos2] <- 0
pie2$x[groupChangePos2-1] <- c2
pie2$y[groupChangePos2-1] <- 0
pie2$x[1] <- c2
pie2$y[1] <- 0
pie2$x[pixel] <- c2
pie2$y[pixel] <- 0

levels(pie2$group) <- levels(d2$key)


x1 <- 1.2 * r1 * sin(offset1 * 2 * pi) 
y1 <- 1.2 * r1 * cos(offset1 * 2 * pi) 

x2 <- x1 + (c2 - x1) * 0.6 
y2 <- y1 + (r2 - y1) * 0.6 

l <- data.frame(x = c(x1, x2, x1, x2), y <- c(y1, y2, -y1, -y2),
                group = c(1, 1, 2, 2))
colnames(l) <- c("x", "y", "group")

blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    plot.title=element_blank()) +
  theme(axis.text.x=element_blank()) + 
  theme(legend.position="right") + 
  theme(panel.grid=element_blank()) +
  theme(axis.text=element_blank()) +
  theme(legend.title = element_blank()) 

p <- ggplot() + geom_polygon(data=pie1,aes(x,y,fill = group)) +
  geom_polygon(data=pie2,aes(x,y,fill = group)) + 
  geom_text_repel(data=d1, 
                  aes(x=1.2*r1*sin(midPercen*2*pi),y=1.2*r1*cos(midPercen*2*pi), 
                      label = paste(key, "\n", text)),
                  alpha = 0.6)+
  geom_text_repel(data=d2, 
                  aes(x=c2 + 1.2*r2*sin(midPercen*2*pi),y=1.2*r2*cos(midPercen*2*pi), 
                      label = paste(key, "\n", text)),
                  alpha = 0.6)+
  geom_text(aes(x = c2, y = r2 * 1.5, label = "High Yield")) + 
  geom_line(data = l, aes(x, y, group = group),linetype="dotted",  alpha = 0.6) +
  geom_line(data = pie1Sep, aes(x, y, group = group), col = "white", alpha = 0.6, size = 1) +
  geom_line(data = pie2Sep, aes(x, y, group = group), col = "white", alpha = 0.6, size = 1) +
  coord_fixed(ratio = 1) +
  scale_fill_manual(values = colorRampPalette(c(brewer.pal(9, "PuBuGn")[4:7], brewer.pal(9, "Blues")[8:2]))(n+1)) +
  blank_theme +  
  ggtitle("%Market Value by Rating") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.title = element_text(size=20, color = "grey44"))
print(p)

dev.off(); #dev.off returns the number and name of the new active device (after the specified device has been shut down). (device = graphical device)
#file() opens a file, in this case the image. rb = read binary
#readBin() reads binary data. what = described the mode of the data. In this case, it''s raw data. n = maximum number of records to read.
#data.frame converts the data to a data frame, which is required as output by SQL Server. The result is written to the OutputDataset variable.
OutputDataset <- data.frame(data=readBin(file(image_file,"rb"),what=raw(),n=1e6));


',
     @input_data_1 = @ChartInputSource,
     @input_data_1_name = N'dataset',
     @output_data_1_name = N'OutputDataset';
	   --WITH RESULT SETS((plot VARBINARY(MAX)));


INSERT INTO [Rpt].[ChartBinary]
([ChartTitle],
 [ChartBinaryData],
 [ChartInputSource],
 [ChartDateTime],
 [ReportId],
 [RiskDate]
)
       SELECT @ChartTitle,
              [binData],
              @ChartInputSource,
              GETDATE(),
		    @ReportId,
		    @RiskDate
       FROM @ChartBinary;

SELECT *
FROM [Rpt].[ChartBinary] [c]
WHERE 
[c].[RiskDate] = @RiskDate AND
[c].[ChartTitle] = @ChartTitle
      AND [c].[ChartBinaryId] =
(
    SELECT MAX([ChartBinaryId])
    FROM [Rpt].[ChartBinary] [c2]
    WHERE [c2].[ChartTitle] = [c].[ChartTitle]
    AND [c2].[ReportId] = [c].[ReportId]
    AND [c2].[RiskDate] = [c].[RiskDate]
);

END