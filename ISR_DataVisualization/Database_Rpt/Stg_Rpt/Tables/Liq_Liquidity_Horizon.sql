CREATE TABLE [Stg_Rpt].[Liq_Liquidity_Horizon] (
    [Liq_Liquidity_Horizon_key] INT           IDENTITY (1, 1) NOT NULL,
    [Mix]                       NVARCHAR (50) NULL,
    [LCR_Time]                  NVARCHAR (50) NULL,
    [Core]                      NVARCHAR (50) NULL,
    [Core_Plus]                 NVARCHAR (50) NULL,
    [QY_Date]                   NVARCHAR (50) NULL,
    [Source]                    NVARCHAR (50) NULL,
    [ETL_Load_Date]             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Liquidity_Horizon_key] ASC)
);

