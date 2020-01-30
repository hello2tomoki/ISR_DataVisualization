CREATE TABLE [Stg_Rpt].[Liq_Stressed_FX_Obligation_CAD] (
    [Liq_Stressed_FX_Obligation_CAD_Key] INT           IDENTITY (1, 1) NOT NULL,
    [CAD_Text]                           NVARCHAR (50) NULL,
    [QY_Date]                            DATETIME      NULL,
    [Source]                             NVARCHAR (50) NULL,
    [ETL_Load_Date]                      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Stressed_FX_Obligation_CAD_Key] ASC)
);

