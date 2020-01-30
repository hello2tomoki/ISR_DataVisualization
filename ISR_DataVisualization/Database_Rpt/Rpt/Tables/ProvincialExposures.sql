CREATE TABLE [Rpt].[ProvincialExposures]
([Id]             INT IDENTITY(1, 1) NOT NULL,
 [Provincial]     [VARCHAR](50) NOT NULL,
 [Issue_Rate]     [Float] NULL,
 [Debit_Issuance] [Float] NULL,
 [RiskDate]       DATETIME
)
ON [PRIMARY];