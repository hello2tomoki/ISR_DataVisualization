CREATE TABLE [Stg_Rpt].[PUE_Correlated_Sensitivities] (
    [PUE_Correlated_Sensitivities_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Market]                           NVARCHAR (50) NULL,
    [Type]                             NVARCHAR (50) NULL,
    [Equity_1_Per]                     NVARCHAR (50) NULL,
    [Int_1bp]                          NVARCHAR (50) NULL,
    [FX_1bp]                           NVARCHAR (50) NULL,
    [QY_Date]                          NVARCHAR (50) NULL,
    [Source]                           NVARCHAR (50) NULL,
    [ETL_Load_Date]                    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Correlated_Sensitivities_Key] ASC)
);

