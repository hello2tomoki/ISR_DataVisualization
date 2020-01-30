CREATE TABLE [Stg_Rpt].[PUE_VaR_Line_Chart] (
    [PUE_VaR_Line_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [VaR_Date]               NVARCHAR (50) NULL,
    [Total_Equity]           NVARCHAR (50) NULL,
    [Total_Equity_Benchmark] NVARCHAR (50) NULL,
    [QY_Date]                NVARCHAR (50) NULL,
    [Source]                 NVARCHAR (50) NULL,
    [ETL_Load_Date]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_VaR_Line_Chart_Key] ASC)
);

