--EXECUTE [Rpt].[GenerateChartBinary_ProvincialDebtInssuance] @RiskDate = '2018-02-28'
CREATE PROCEDURE [Rpt].[GenerateChartBinary_ProvincialDebtInssuance] (@RiskDate DATE) AS
BEGIN

DECLARE @ReportId INT = 0;
DECLARE @ChartTitle VARCHAR(100)= 'Provincial - Debt issuance(M$)';
DECLARE @ChartInputSource NVARCHAR(MAX) = N'SELECT [Provincial], [Debit_Issuance] FROM [Rpt].[ProvincialExposures] WHERE [RiskDate] = '''+ Convert(NVARCHAR(10),@RiskDate) +''';';
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


colnames(dataset) <- c("Provincial", "Debit.Issuance")
rownames(dataset) <- dataset$Provincial
debitIssue <- data.frame(debitIssue= dataset$Debit.Issuance)
debitIssue$debitIssue <- as.numeric(debitIssue$debitIssue)

row.names(debitIssue) <- dataset$Provincial

library(raster)

provinces <- c("British Columbia", "Alberta", "Saskatchewan", "Manitoba", "Ontario", "Québec")

canada <- getData("GADM",country="CAN",level=1)
ca.province <- canada[canada$NAME_1 %in% provinces, ]

#Create a function to generate a continuous color palette
rbPal <- colorRampPalette(c(''white'',''steelblue4''))
varRange <- max(debitIssue$debitIssue) - min(debitIssue$debitIssue)
debitIssue$debitIssueScale<- (debitIssue$debitIssue- min(debitIssue$debitIssue) + varRange * 0.1)/(varRange/0.7)
debitIssue$color <- rbPal(100)[c(round(debitIssue$debitIssueScale* 100))]

#plot

plot(ca.province, main = ''Provincial - Debt issuance(M$)'')
plot(ca.province[ca.province$NAME_1 == "British Columbia", ], border="white", col=debitIssue["BC", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Alberta", ], border="white", col=debitIssue["AB", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Saskatchewan", ], border="white", col=debitIssue["SK", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Manitoba", ], border="white", col=debitIssue["MB", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Ontario", ], border="white", col=debitIssue["ON", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Québec", ], border="white", col=debitIssue["QC", "color"], add=TRUE)

text(ca.province[ca.province$NAME_1 == "British Columbia", ], labels = paste("BC", "\n", debitIssue["BC", "debitIssue"]))
text(ca.province[ca.province$NAME_1 == "Alberta", ], labels = paste("AB", "\n", debitIssue["AB", "debitIssue"]))
text(ca.province[ca.province$NAME_1 == "Saskatchewan", ], labels = paste("SK", "\n", debitIssue["SK", "debitIssue"]))
text(ca.province[ca.province$NAME_1 == "Manitoba", ], labels = paste("MB", "\n", debitIssue["MB", "debitIssue"]))
text(ca.province[ca.province$NAME_1 == "Ontario", ], labels = paste("ON", "\n", debitIssue["ON", "debitIssue"]))
text(ca.province[ca.province$NAME_1 == "Québec", ], labels = paste("QC", "\n", debitIssue["QC", "debitIssue"]))


dev.off(); #dev.off returns the number and name of the new active device (after the specified device has been shut down). (device = graphical device)
#file() opens a file, in this case the image. rb = read binary
#readBin() reads binary data. what = described the mode of the data. In this case, it''s raw data. n = maximum number of records to read.
#data.frame converts the data to a data frame, which is required as output by SQL Server. The result is written to the OutputDataset variable.
OutputDataset <- data.frame(data=readBin(file(image_file,"rb"),what=raw(),n=1e6));

',
     @input_data_1 = @ChartInputSource,
	   --	N'
	   --SELECT [Provincial],
	   ---- [Issue_Rate],
	   --Convert(float,[Debit_Issuance__M__])as [Debit_Issuance__M__]
	   --FROM [dbo].[Provincial Exposures];
	   --;' 
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

END;