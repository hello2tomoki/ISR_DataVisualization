CREATE TABLE [Stg_Rpt].[Liq_BCI_Historical_Liquidity_Score_Illiquid_Exposure] (
    [Liq_BCI_Historical_Liquidity_Score_Illiquid_Exposure_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Period_Quarter]                                           NVARCHAR (50) NULL,
    [BCI_Liquidity_Score]                                      NVARCHAR (50) NULL,
    [Illiquid_Assets_Exposure]                                 NVARCHAR (50) NULL,
    [QY_Date]                                                  NVARCHAR (50) NULL,
    [Source]                                                   NVARCHAR (50) NULL,
    [ETL_Load_Date]                                            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_BCI_Historical_Liquidity_Score_Illiquid_Exposure_Key] ASC)
);

