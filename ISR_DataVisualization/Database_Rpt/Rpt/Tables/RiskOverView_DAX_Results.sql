CREATE TABLE [Rpt].[RiskOverView_DAX_Results]
([RiskDate]                      DATE NULL,
 [Shock]                         VARCHAR(100) NULL,
 [Confidence_Interval]           VARCHAR(100) NULL,
 [Contribution By]               VARCHAR(100) NULL,
 [Description]                   VARCHAR(100) NULL,
 [Market_Value]                  [FLOAT] NULL,
 [Market_Value_(%)]              [FLOAT] NULL,
 [Standalone_Absolute_VaR]       [FLOAT] NULL,
 [Standalone_Absolute_VaR_(%)]   [FLOAT] NULL,
 [Contribution_Absolute_VaR]     [FLOAT] NULL,
 [Contribution_Absolute_VaR_(%)] [FLOAT] NULL,
 [Evaluate_By]                   VARCHAR(100) NULL,
 [RptDateTime]                   DATETIME DEFAULT GETDATE()
)
ON [PRIMARY];