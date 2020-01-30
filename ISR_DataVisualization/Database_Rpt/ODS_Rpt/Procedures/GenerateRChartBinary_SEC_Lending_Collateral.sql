

CREATE PROCEDURE  [ODS_Rpt].[GenerateRChartBinary_SEC_Lending_Collateral] (@RiskDate DATE) AS
BEGIN
/*
Author -	    Xie, Eva
Description - Executes R Script to generate to image Binary to be used as Input to SSRS		       report.
Test -	    [ODS_Rpt].[GenerateRChartBinary_SEC_Lending_Collateral] '06/30/2018'

*/

--DECLARE @RiskDate DATE = '2018-06-30';
DECLARE @PreviousDate date= (SELECT DATEADD(quarter, DATEDIFF(quarter, 0, @RiskDate), - 1));

DECLARE @ReportId INT = 0;
DECLARE @ChartTitle VARCHAR(100)= 'Currency Exposure';

--DECLARE @ChartInputSource NVARCHAR(MAX) = 
--N'SELECT * FROM [Rpt].[SEC_Lending_Collateral]'


--DECLARE @ChartInputSource NVARCHAR(MAX) = 
--N'SELECT * FROM [Stg_Rpt].[SEC_Lending_Collateral] WHERE cast(QY_Date as Date) BETWEEN
--'''+Convert(NVARCHAR(10),@PreviousDate) +''' AND 
--'''+Convert(NVARCHAR(10),@RiskDate) +''';'

DECLARE @ChartInputSource NVARCHAR(MAX) = 
N'SELECT *
     
FROM [Stg_Rpt].[SEC_Lending_Collateral] 

WHERE cast(QY_Date as Date) BETWEEN
'''+Convert(NVARCHAR(10),@PreviousDate) +''' AND 
'''+Convert(NVARCHAR(10),@RiskDate) +''';'

--SELECT @ChartInputSource 

DECLARE @ChartBinary TABLE([binData] VARBINARY(MAX) NULL);
INSERT INTO @ChartBinary
EXEC [sp_execute_external_script]
     @language = N'R',
     @script = N'

#create a temporary file
image_file = tempfile();

#create a png graphic device
png(filename = image_file, width=1300, height=700); 


my_palette = c("#00365B", "#696F78","#C0CAAB", "#00ABBD",
               "#DC642B", "#FDB736", "#4A317E")

#loading packages
if(!require("ggplot2")) install.packages("ggplot2")

library(ggplot2)

plot.data <- dataset[, c("Type", "QY_Date", "Debt_Breakup")]
plot.data$QY_Date <- as.Date(plot.data$QY_Date, format="%m/%d/%Y")

lastDay <- min(plot.data$QY_Date)
thisDay <- max(plot.data$QY_Date)
             
colnames(plot.data) <- c("Type", "Ring", "Value")
plot.data$Value <- as.numeric(as.character(plot.data$Value))

total <- round(sum(plot.data[plot.data$Ring == thisDay, "Value"]) / 1000000000, 2)
##total <- round(dataset[1, "Total"], 0)
##/1000000000

             
plot.data[plot.data$Ring == lastDay, "Value"] <- plot.data[plot.data$Ring == lastDay, "Value"] / 
                                                         sum(plot.data[plot.data$Ring == lastDay, "Value"])
plot.data[plot.data$Ring == thisDay, "Value"] <- plot.data[plot.data$Ring == thisDay, "Value"] / 
                                                         sum(plot.data[plot.data$Ring == thisDay, "Value"])
plot.data$Type <- factor(plot.data$Type, levels = unique(plot.data$Type))


blank_theme <- theme_minimal()+
  theme(
    axis.title = element_blank(),
    panel.border = element_blank()) +
    #plot.title=element_blank()) +
  theme(panel.grid=element_blank()) +
  theme(axis.text=element_blank()) + 
  theme(legend.position="right") + 
  theme(legend.title = element_blank()) +
  theme(legend.text=element_text(size=28))+
  theme(panel.background = element_blank()) 

gg <- 
  ggplot(plot.data, aes()) +
  geom_bar(data = plot.data[plot.data$Ring == lastDay, ],
           stat = "identity", width = 0.35, colour="white", size = 1,
           aes(x = 1, y = Value, fill = Type)) +
  geom_bar(data = plot.data[plot.data$Ring == thisDay, ],
           stat = "identity", width = 0.35, colour="white", size = 1,
           aes(x = 1.35, y = Value, fill = Type)) +
  scale_fill_manual(values = my_palette, guide = FALSE) +
  ##Start Pie chart data label text
  ##Start of Inner circle 
  geom_text(data = plot.data[plot.data$Ring == lastDay, ],
            aes(x = 1, y = 1-(cumsum(Value) + c(0, head(cumsum(Value), n=-1)))/2, 
            label = paste(round(Value*100),"%", sep = "")), color = "white", size = 10, fontface = 2) +
  ##End of Inner circle 
  ##Start of Outer circle 
  geom_text(data = plot.data[plot.data$Ring == thisDay, ],
            aes(x = 1.35, y = 1-(cumsum(Value) + c(0, head(cumsum(Value), n=-1)))/2, 
                label = paste(round(Value*100),"%", sep = "")), color = "white", size = 10, fontface = 2) +
   ##End of Outer circle 
   ##End of Pie chart data label text
    #### legend for inner outer
    geom_hline(data = plot.data, alpha = 0,
             aes(yintercept = Value, 
                 size = paste("Inner: ", format(as.Date(thisDay),"%b %d, %Y")))) +
  geom_hline(data = plot.data, alpha = 0,
             aes(yintercept = Value, 
                 size = paste("Outer: ", format(as.Date(lastDay),"%b %d, %Y")))) +
  # legend for tyoe
  geom_point(data = plot.data, aes(x = -10, y = 0, colour = Type), 
             shape = 20) +
  scale_color_manual(values = my_palette) +
  ## line space
  guides(fill = FALSE,
         colour = guide_legend(order = 1,
                               override.aes = list(size = 25)),
         size = guide_legend(order = 2,
                               override.aes = list(size = 25))) +
  coord_fixed(ratio = 1) +
  coord_polar(theta="y") +
  xlim(c(0, 1.55)) + 
  ##Start of Center Text
  geom_text(x = -0.1, y = 0.5, label = paste("$", total, "B Collateral", sep = ""),
    size = 8, alpha = 0.15, fontface = 2) +
  geom_text(x = 0.1, y = 0.5, label = "105% of Loan MV",
            size = 8, alpha = 0.15) +
  blank_theme 
  
print(gg)


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

	 select * from @ChartBinary

--INSERT INTO [Rpt].[ChartBinary]
--([ChartTitle],
-- [ChartBinaryData],
-- [ChartInputSource],
-- [ChartDateTime],
-- [ReportId],
-- [RiskDate]
--)
      -- SELECT @ChartTitle,
      --        [binData],
      --        @ChartInputSource,
      --        GETDATE(),
		    --@ReportId,
		    --@RiskDate
      -- FROM @ChartBinary;

--SELECT * FROM [Rpt].[ChartBinary];
--Return Last Report
--SELECT *
--FROM [Rpt].[ChartBinary] [c]
--WHERE 
--[c].[RiskDate] = @RiskDate AND
--[c].[ChartTitle] = @ChartTitle
--      AND [c].[ChartBinaryId] =
--(
--    SELECT MAX([ChartBinaryId])
--    FROM [Rpt].[ChartBinary] [c2]
--    WHERE [c2].[ChartTitle] = [c].[ChartTitle]
--    AND [c2].[ReportId] = [c].[ReportId]
--    AND [c2].[RiskDate] = [c].[RiskDate]
--)

END