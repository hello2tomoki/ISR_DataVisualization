CREATE TABLE [Stg_Rpt].[Liq_Liquidity_1_Month_Breakdown_Tablix] (
    [Liq_Liquidity_1_Month_Breakdown_Tablix_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Metric]                                     NVARCHAR (50) NULL,
    [Sub_Metric]                                 NVARCHAR (50) NULL,
    [Prev_Date_Value]                            NVARCHAR (50) NULL,
    [Curr_Date_Value]                            NVARCHAR (50) NULL,
    [Prev_Date]                                  NVARCHAR (50) NULL,
    [Curr_Date]                                  NVARCHAR (50) NULL,
    [QY_Date]                                    NVARCHAR (50) NULL,
    [Source]                                     NVARCHAR (50) NULL,
    [ETL_Load_Date]                              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Liquidity_1_Month_Breakdown_Tablix_Key] ASC)
);

