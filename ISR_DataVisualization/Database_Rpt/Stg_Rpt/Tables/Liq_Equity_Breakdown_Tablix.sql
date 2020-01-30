CREATE TABLE [Stg_Rpt].[Liq_Equity_Breakdown_Tablix] (
    [Liq_Equity_Breakdown_Tablix_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Liquidity_Type]                  NVARCHAR (50) NULL,
    [Days_to_Liquidation]             NVARCHAR (50) NULL,
    [Metric_Date_Prev_Month]          NVARCHAR (50) NULL,
    [Metric_Value_Prev_Month]         NVARCHAR (50) NULL,
    [Metric_Date_Curr_Month]          NVARCHAR (50) NULL,
    [Metric_Value_Curr_Month]         NVARCHAR (50) NULL,
    [QY_Date]                         NVARCHAR (50) NULL,
    [Source]                          NVARCHAR (50) NULL,
    [ETL_Load_Date]                   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Equity_Breakdown_Tablix_Key] ASC)
);

