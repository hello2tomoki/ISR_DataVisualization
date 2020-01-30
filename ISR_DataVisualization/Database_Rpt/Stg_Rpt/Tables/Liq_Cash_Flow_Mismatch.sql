CREATE TABLE [Stg_Rpt].[Liq_Cash_Flow_Mismatch] (
    [Liq_Cash_Flow_Mismatch_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Metric]                     NVARCHAR (50) NULL,
    [1_Month]                    NVARCHAR (50) NULL,
    [1_3_Months]                 NVARCHAR (50) NULL,
    [3_12_ Months]               NVARCHAR (50) NULL,
    [Core_Assets]                NVARCHAR (50) NULL,
    [QY_Date]                    DATETIME      NULL,
    [Source]                     NVARCHAR (50) NULL,
    [ETL_Load_Date]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Cash_Flow_Mismatch_Key] ASC)
);

