CREATE TABLE [Stg_Rpt].[Liq_Stressed_FX_Obligation_Tablix] (
    [Liq_Stressed_FX_Obligation_Tablix_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Asset_Class]                           NVARCHAR (50) NULL,
    [Currency]                              NVARCHAR (50) NULL,
    [Final_Market_Value]                    NVARCHAR (50) NULL,
    [QY_Date]                               DATETIME      NULL,
    [Source]                                NVARCHAR (50) NULL,
    [ETL_Load_Date]                         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Stressed_FX_Obligation_Tablix_Key] ASC)
);

