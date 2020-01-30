


CREATE PROCEDURE  [ODS_Rpt].[GenerateRChartBinary_Provincial_Debt_Issue] (@QY_Date DATE) AS
BEGIN

--DECLARE @RiskDate DATE = '2018-07-31';

DECLARE @ChartInputSource NVARCHAR(MAX) = 
N'SELECT Province_Code, Debt_Issuance_MS
     
from [Stg_Rpt].[FI_Provincial_Exposures]
Where 
Province_Code in(
''ON'',
''QC'',
''AB'',
''BC'',
''MB'',
''SK''
)

AND cast(QY_Date as Date) =
'''+Convert(NVARCHAR(10),@QY_Date) +''';'


DECLARE @ChartBinary TABLE([binData] VARBINARY(MAX) NULL);
INSERT INTO @ChartBinary
EXEC [sp_execute_external_script]
     @language = N'R',
     @script = N'

#create a temporary file
image_file = tempfile();

#create a png graphic device
png(filename = image_file, width=800, height=450); 


colnames(dataset) <- c("Provincial", "Debit.Issuance")
rownames(dataset) <- dataset$Provincial
debitIssue <- data.frame(debitIssue = as.numeric(as.character(dataset$Debit.Issuance)))

row.names(debitIssue) <- dataset$Provincial

library(raster)

provinces <- c("British Columbia", "Alberta", "Saskatchewan", "Manitoba", "Ontario", "Québec")

canada <- getData("GADM",country="CAN",level=1)
ca.province <- canada[canada$NAME_1 %in% provinces, ]

#Create a function to generate a continuous color palette
rbPal <- colorRampPalette(c("white","steelblue4"))
varRange <- max(debitIssue$debitIssue) - min(debitIssue$debitIssue)
debitIssue$debitIssueScale<- (debitIssue$debitIssue- min(debitIssue$debitIssue) + varRange * 0.1)/(varRange/0.7)
debitIssue$color <- rbPal(100)[c(round(debitIssue$debitIssueScale* 100))]

#plot
# title
#plot(ca.province, main = "Provincial - Debt issuance(M$)")
plot(ca.province)
plot(ca.province[ca.province$NAME_1 == "British Columbia", ], border="white", col=debitIssue["BC", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Alberta", ], border="white", col=debitIssue["AB", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Saskatchewan", ], border="white", col=debitIssue["SK", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Manitoba", ], border="white", col=debitIssue["MB", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Ontario", ], border="white", col=debitIssue["ON", "color"], add=TRUE)
plot(ca.province[ca.province$NAME_1 == "Québec", ], border="white", col=debitIssue["QC", "color"], add=TRUE)

text(ca.province[ca.province$NAME_1 == "British Columbia", ], labels = paste("BC", "\n", format(round(debitIssue["BC", "debitIssue"], 0),big.mark=",")))
text(ca.province[ca.province$NAME_1 == "Alberta", ], labels = paste("AB", "\n", format(round(debitIssue["AB", "debitIssue"], 0),big.mark=",")))
text(ca.province[ca.province$NAME_1 == "Saskatchewan", ], labels = paste("SK", "\n", format(round(debitIssue["SK", "debitIssue"], 0),big.mark=",")))
text(ca.province[ca.province$NAME_1 == "Manitoba", ], labels = paste("MB", "\n", format(round(debitIssue["MB", "debitIssue"], 0),big.mark=",")))
text(ca.province[ca.province$NAME_1 == "Ontario", ], labels = paste("ON", "\n", format(round(debitIssue["ON", "debitIssue"],0),big.mark=",")))
text(ca.province[ca.province$NAME_1 == "Québec", ], labels = paste("QC", "\n", format(round(debitIssue["QC", "debitIssue"],0),big.mark=",")))
  


dev.off(); #dev.off returns the number and name of the new active device (after the specified device has been shut down). (device = graphical device)
#file() opens a file, in this case the image. rb = read binary
#readBin() reads binary data. what = described the mode of the data. In this case, it''s raw data. n = maximum number of records to read.
#data.frame converts the data to a data frame, which is required as output by SQL Server. The result is written to the OutputDataset variable.
OutputDataset <- data.frame(data=readBin(file(image_file,"rb"),what=raw(),n=1e6));


',
     @input_data_1 = @ChartInputSource,
     @input_data_1_name = N'dataset',
     @output_data_1_name = N'OutputDataset';

	 select * from @ChartBinary

END