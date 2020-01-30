--EXECUTE [Rpt].[GenerateChartBinary_ProvincialDebtInssuance] @RiskDate = '2018-02-28'
CREATE PROCEDURE [Rpt].[GenerateChartBinary_ProvincialIssueRate] (@RiskDate DATE) AS
BEGIN
--DECLARE @RiskDate DATE = '2018-04-30';

DECLARE @ReportId INT = 0;
DECLARE @ChartTitle VARCHAR(100)= 'Provincial - Issue Rate';
DECLARE @ChartInputSource NVARCHAR(MAX) = N'SELECT [Provincial], [Issue_Rate] FROM [Rpt].[ProvincialExposures] WHERE [RiskDate] = '''+ Convert(NVARCHAR(10),@RiskDate) +''';';
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
png(filename = image_file, width=800, height=600); 


colnames(dataset) <- c("Provincial", "Issue.Rate")
rownames(dataset) <- dataset$Provincial
issueRate <- data.frame(issueRate = dataset$Issue.Rate )
row.names(issueRate) <- dataset$Provincial

library(raster)

provinces <- c("British Columbia", "Alberta", "Saskatchewan", "Manitoba", "Ontario", "Québec")

canada <- getData("GADM",country="CAN",level=1)
ca.province <- canada[canada$NAME_1 %in% provinces, ]

#Create a function to generate a continuous color palette
rbPal <- colorRampPalette(c(''white'',''darkgreen''))
varRange <- max(issueRate$issueRate) - min(issueRate$issueRate)
issueRate$issueRateScale <- (issueRate$issueRate - min(issueRate$issueRate) + varRange * 0.1)/(varRange/0.7)
issueRate$color <- rbPal(100)[c(round(issueRate$issueRateScale * 100))]

#plot

plot(ca.province, main = ''Provincial - BCI % of issue'')
plot(ca.province[ca.province$NAME_1 == "British Columbia", ], border="white", col=issueRate["BC", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Alberta", ], border="white", col=issueRate["AB", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Saskatchewan", ], border="white", col=issueRate["SK", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Manitoba", ], border="white", col=issueRate["MB", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Ontario", ], border="white", col=issueRate["ON", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Québec", ], border="white", col=issueRate["QC", "color"], add=TRUE)

text(ca.province[ca.province$NAME_1 == "British Columbia", ], labels = paste("BC", "\n", round(issueRate["BC", "issueRate"], 2),"%"))
text(ca.province[ca.province$NAME_1 == "Alberta", ], labels = paste("AB", "\n", round(issueRate["AB", "issueRate"], 2),"%"))
text(ca.province[ca.province$NAME_1 == "Saskatchewan", ], labels = paste("SK", "\n", round(issueRate["SK", "issueRate"], 2),"%"))
text(ca.province[ca.province$NAME_1 == "Manitoba", ], labels = paste("MB", "\n", round(issueRate["MB", "issueRate"], 2),"%"))
text(ca.province[ca.province$NAME_1 == "Ontario", ], labels = paste("ON", "\n", round(issueRate["ON", "issueRate"], 2),"%"))
text(ca.province[ca.province$NAME_1 == "Québec", ], labels = paste("QC", "\n", round(issueRate["QC", "issueRate"], 2),"%"))

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