CREATE PROCEDURE [Rpt].[GenerateChartBinary_RiskOverview] (@RiskDate DATE) AS
BEGIN

--DECLARE @RiskDate DATE = '2018-03-31';

DECLARE @PreviousDate date= (SELECT DATEADD(quarter, DATEDIFF(quarter, 0, @RiskDate), - 1));
DECLARE @ReportId INT = 0;
DECLARE @ChartTitle VARCHAR(100)= 'Risk Overview';

--change risk date
DECLARE @ChartInputSource NVARCHAR(MAX) = 
N'SELECT *  FROM [Rpt].[RiskOverView] WHERE RiskDate BETWEEN 
'''+Convert(NVARCHAR(10),@PreviousDate) +''' AND 
'''+Convert(NVARCHAR(10),@RiskDate) +''' ORDER BY RiskDate';
/*
--Sandbox (Example use of Openrowset with execute stored procedure
DECLARE @ChartInputSource NVARCHAR(MAX)= 'Execute sandbox.dbo.usp_get_ProvincialExposures';
DECLARE @ChartInputSourceOpenrwoset NVARCHAR(MAX)= N'SELECT a.* FROM OPENROWSET(''SQLNCLI'', ''Server=.;Trusted_Connection=yes;'', '''+@ChartInputSource+''') AS a;';
--SELECT a.* FROM OPENROWSET('SQLNCLI', 'Server=.;Trusted_Connection=yes;', 'Execute sandbox.dbo.usp_get_ProvincialExposures') AS a;  

*/

DECLARE @ChartBinary TABLE([binData] VARBINARY(MAX) NULL);
INSERT INTO @ChartBinary
EXEC [sp_execute_external_script]
     @language = N'R',
     @script = N'

#create a temporary file
image_file = tempfile();

#create a png graphic device
png(filename = image_file, width=1600, height=800); 

if(!require(''ggplot2'')) install.packages(''ggplot2'')
if(!require(''reshape'')) install.packages(''reshape'')
if(!require(''RColorBrewer'')) install.packages(''RColorBrewer'')

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
    ggplot(data = plot.data) +
      geom_bar(data = plot.data, aes(x = rowSubClass, y = value, 
                                   fill = as.factor(barClass)), 
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
      scale_fill_manual(values = colorRampPalette(brewer.pal(9, "GnBu")[6:9])(nlevels(as.factor(plot.data$barClass)))) +
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

p <- BarChartGroup(dataset, barClass, rowClass, rowSubClass, colClass, percentage) 

print(p)
#plot(1,1)

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

--SELECT * FROM [Rpt].[ChartBinary];
--Return Last Report
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