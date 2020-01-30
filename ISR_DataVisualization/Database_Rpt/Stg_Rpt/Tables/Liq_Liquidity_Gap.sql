CREATE TABLE [Stg_Rpt].[Liq_Liquidity_Gap] (
    [Liq_Liquidity_Gap_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Metric]                NVARCHAR (50) NULL,
    [Marginal_Gap]          NVARCHAR (50) NULL,
    [Cumulative_Gap]        NVARCHAR (50) NULL,
    [QY_Date]               DATETIME      NULL,
    [Source]                NVARCHAR (50) NULL,
    [ETL_Load_Date]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Liquidity_Gap_Key] ASC)
);

