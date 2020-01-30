CREATE TABLE [Stg_Rpt].[Liq_Concentration_of_Liquidity_Supply_Tablix] (
    [Liq_Concentration_of_Liquidity_Supply_Tablix_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Supply_Type]                                      NVARCHAR (50) NULL,
    [Bond_Type]                                        NVARCHAR (50) NULL,
    [Metric_Type]                                      NVARCHAR (50) NULL,
    [Metric_Date_Curr_Month]                           NVARCHAR (50) NULL,
    [Metric_Value_Curr_Month]                          NVARCHAR (50) NULL,
    [Metric_Date_Prev_Month]                           NVARCHAR (50) NULL,
    [Metric_Value_Prev_Month]                          NVARCHAR (50) NULL,
    [QY_Date]                                          NVARCHAR (50) NULL,
    [Source]                                           NVARCHAR (50) NULL,
    [ETL_Load_Date]                                    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Concentration_of_Liquidity_Supply_Tablix_Key] ASC)
);

