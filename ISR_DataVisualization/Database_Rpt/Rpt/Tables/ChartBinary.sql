CREATE TABLE [Rpt].[ChartBinary]
([ChartBinaryId]    INT IDENTITY(1, 1) PRIMARY KEY,
 [ChartTitle]       VARCHAR(100) NULL,
 [ChartBinaryData]  VARBINARY(MAX) NULL,
 [ChartInputSource] VARCHAR(MAX) NULL,
 [ChartDateTime]    DATETIME DEFAULT GETDATE(),
 [ReportId]         INT DEFAULT 0,
 [RiskDate]         DATE NULL
);