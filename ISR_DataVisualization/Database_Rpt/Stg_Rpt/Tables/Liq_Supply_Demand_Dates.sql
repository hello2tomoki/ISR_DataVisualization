CREATE TABLE [Stg_Rpt].[Liq_Supply_Demand_Dates] (
    [Liq_Supply_Demand_Dates_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Supply_Date]                 NVARCHAR (50) NULL,
    [Demand_Date]                 NVARCHAR (50) NULL,
    [QY_Date]                     DATETIME      NULL,
    [Source]                      NVARCHAR (50) NULL,
    [ETL_Load_Date]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Supply_Demand_Dates_Key] ASC)
);

