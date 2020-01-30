CREATE TABLE [Rpt].[Stressed_Liquidity_Demand_Supply] (
    [Stressed_Liquidity_Demand_Supply_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Asset]                                NVARCHAR (50)  NULL,
    [Liquidity_Demand]                     NVARCHAR (50)  NULL,
    [Liquidity_ Supply]                     NVARCHAR (50)  NULL,
    [QY_Date]                              NVARCHAR (50)  NULL,
    [Source]                               NVARCHAR (150) NULL,
    [ETL_Load_Date]                        DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Stressed_Liquidity_Demand_Supply_Key] ASC)
);

