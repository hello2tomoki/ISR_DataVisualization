
CREATE PROCEDURE [Rpt].[GenerateChartBinary_MarketRiskChange] (@RiskDate DATE) AS
BEGIN

DECLARE @PreviousDate date= (SELECT DATEADD(quarter,0, DATEADD(quarter, -5, @RiskDate)));


DECLARE @ReportId INT = 0;
DECLARE @ChartTitle VARCHAR(100)= 'TF Market Risk Level and Asset Class Contribution';

--change risk date
DECLARE @ChartInputSource NVARCHAR(MAX) = N'SELECT *  FROM [Rpt].[RiskOverView] WHERE RiskDate BETWEEN 
'''+ Convert(NVARCHAR(10),@PreviousDate) +''' AND 
'''+ Convert(NVARCHAR(10),@RiskDate) +''' 
ORDER BY RiskDate';

DECLARE @ChartBinary TABLE([binData] VARBINARY(MAX) NULL);
INSERT INTO @ChartBinary
EXEC [sp_execute_external_script]
     @language = N'R',
     @script = N'

#create a temporary file
image_file = tempfile();

#create a png graphic device
png(filename = image_file, width=800, height=600); 

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
    geom_bar(data = plot.data.bar, aes(x = xAxis, y = barValue, fill = variable), width = 0.5,
             stat="identity") +
    scale_fill_brewer(palette = "YlGnBu") +
    geom_line(data = plot.data.line, alpha = 0.8,
              aes(x = xAxis, y = (lineValue - 0.1) * 20, group = lineLegend, 
                  col = lineLegend)) +
    scale_color_manual(values="black") +
    geom_point(data = plot.data.line, alpha = 0.8,
               aes(x = xAxis, y = (lineValue - 0.1) * 20)) +
    scale_y_continuous(barName, labels = scales::percent,
                       sec.axis = sec_axis(~ . / 20 + 0.1, labels = scales::percent, lineName)) +
    theme 
  
}

# data cleaning (col names)
colnames(dataset)[8] <- "Market_Value_Percentage"
colnames(dataset)[10] <- "Standalone_Absolute_VaR_Percentage"
colnames(dataset)[12] <- "Contribution_Absolute_VaR_Percentage"

xAxis <- as.factor(dataset$RiskDate)
variable <- dataset$Description
variable <- factor(variable, levels = levels(variable)[c(6:9, 1:5)])
barValue <- dataset$Contribution_Absolute_VaR_Percentage
lineValue <- -dataset$Standalone_Absolute_VaR_Percentage

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