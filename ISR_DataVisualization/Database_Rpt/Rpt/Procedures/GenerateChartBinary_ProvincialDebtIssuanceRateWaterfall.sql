CREATE PROCEDURE [Rpt].[GenerateChartBinary_ProvincialDebitIssuanceRateWaterfall] (@RiskDate DATE) AS
BEGIN

DECLARE @ReportId INT = 0;
DECLARE @ChartTitle VARCHAR(100)= 'Waterfall Provincial Debt Issue Rate';
DECLARE @ChartInputSource NVARCHAR(MAX) = N'SELECT [Provincial], [Debit_Issuance] FROM [Rpt].[ProvincialExposures] WHERE [RiskDate] = '''+ Convert(NVARCHAR(10), @RiskDate) +''';';


DECLARE @ChartBinary TABLE([binData] VARBINARY(MAX) NULL);
INSERT INTO @ChartBinary
EXEC [sp_execute_external_script]
     @language = N'R',
     @script = N'

#create a temporary file
image_file = tempfile();

#create a png graphic device
png(filename = image_file, width=800, height=600); 

if(!require("ggplot2")) install.packages("ggplot2")
if(!require("scales")) install.packages("scales")
library(ggplot2)
library(scales)

######################################################
######       Waterfall Chart Function         ########
######################################################

# axis: a vector of text for which the Waterfall axis is desired
# value: a vector of values for which the Waterfall is desired

WaterfallChart <- function (axis, value, percenForm) {
  
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
    plotdata$value <- paste(value,"%",sep="")
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
colnames(dataset) <- c("Province", "debtIssue")

dataset$debtIssueRate <- as.numeric(gsub(",", "", dataset$debtIssue))
dataset$debtIssueRate <- dataset$debtIssueRate/sum(dataset$debtIssueRate)
dataset$debtIssueRate <- round(dataset$debtIssueRate/sum(dataset$debtIssueRate) * 100, 2)

p <- WaterfallChart(dataset$Province, dataset$debtIssueRate, T) +
  ggtitle("Provincial - Debit Issuance Rate") +
  theme(plot.title = element_text(hjust = 0.5))
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
)

END