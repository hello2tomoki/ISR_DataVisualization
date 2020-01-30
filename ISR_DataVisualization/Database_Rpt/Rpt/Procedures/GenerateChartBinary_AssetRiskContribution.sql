CREATE PROCEDURE [Rpt].[GenerateChartBinary_AssetRiskContribution] (@RiskDate DATE) AS
BEGIN

--DECLARE @PreviousDate date= (SELECT DATEADD(quarter, DATEDIFF(quarter, 0, @RiskDate), - 1));


DECLARE @ReportId INT = 0;
DECLARE @ChartTitle VARCHAR(100)= 'Asset Risk Contribution';
DECLARE @ChartInputSource NVARCHAR(MAX) = N'SELECT *  FROM [Rpt].[AssetRiskContribution]';

DECLARE @ChartBinary TABLE([binData] VARBINARY(MAX) NULL);
INSERT INTO @ChartBinary
EXEC [sp_execute_external_script]
     @language = N'R',
     @script = N'

#create a temporary file
image_file = tempfile();

#create a png graphic device
png(filename = image_file, width=1200, height=800); 

if(!require(''ggplot2'')) install.packages(''ggplot2'')
if(!require(''ggrepel'')) install.packages(''ggrepel'')
if(!require(''dplyr'')) install.packages(''dplyr'')

library(ggplot2)
library(ggrepel)
library(dplyr)

dataset[is.na(dataset)] <- 0

plot.data <- dataset %>% 
  group_by(AssetClass) %>% 
  summarise(PV = sum(PV), StandaloneAbsoluteVar = sum(StandaloneAbsoluteVar), 
            Inner = sum(GT_PV), Outer = sum(GT_StandaloneAbsoluteVar)) 
plot.data$Inner <- plot.data$Inner/sum(plot.data$Inner)
plot.data$Outer <- plot.data$Outer/sum(plot.data$Outer)


blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_blank()) +
  theme(axis.text.x=element_blank()) + 
  theme(legend.position="right") + 
  theme(panel.grid=element_blank()) +
  theme(axis.text=element_blank()) +
  theme(axis.ticks=element_blank())

p <- ggplot(plot.data) + 
  geom_bar(stat = "identity", width = 0.6, aes(x = 1, y = Inner/sum(Inner), fill = AssetClass)) +
  geom_bar(stat = "identity", width = 1.2, aes(x = 3, y = Outer/sum(Outer), fill = AssetClass)) +
 coord_polar(theta="y") + 
  blank_theme +
  xlim(c(0, 4)) +
  scale_fill_brewer(palette="YlGnBu") +
geom_text_repel(data = plot.data, 
aes(x = 1.5, y = 1-(cumsum(Inner)/sum(Inner) + c(0, head(cumsum(Inner)/sum(Inner), n=-1)))/2, 
    label = paste(round(Inner*100, 2),"%"), fill = AssetClass),
label.padding = unit(0.05, "lines"),
show.legend = FALSE,
inherit.aes = FALSE, size = 3.5) +
geom_text_repel(data = plot.data, 
aes(x = 4, y = 1-(cumsum(Outer)/sum(Outer) + c(0, head(cumsum(Outer)/sum(Outer), n=-1)))/2, 
    label = paste(round(Outer*100, 2),"%"), fill = AssetClass),
label.padding = unit(0.05, "lines"),
show.legend = FALSE,
inherit.aes = FALSE, size = 3.5) 


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
)

END