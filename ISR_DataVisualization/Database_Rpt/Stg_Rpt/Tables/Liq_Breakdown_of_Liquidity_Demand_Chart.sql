CREATE TABLE [Stg_Rpt].[Liq_Breakdown_of_Liquidity_Demand_Chart] (
    [Liq_Breakdown_of_Liquidity_Demand_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Stressed_Type]                               NVARCHAR (50) NULL,
    [Stressed]                                    NVARCHAR (50) NULL,
    [Stressed_Date]                               NVARCHAR (50) NULL,
    [Stressed_Value]                              NVARCHAR (50) NULL,
    [QY_Date]                                     DATETIME      NULL,
    [Source]                                      NVARCHAR (50) NULL,
    [ETL_Load_Date]                               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Breakdown_of_Liquidity_Demand_Chart_Key] ASC)
);

