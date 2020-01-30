CREATE TABLE [Stg_Rpt].[Liq_Maturity_Profile_of_Liquidity_Supply_Charts] (
    [Liq_Maturity_Profile_of_Liquidity_Supply_Charts_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Effective_Date]                                      NVARCHAR (50) NULL,
    [Asset_Type]                                          NVARCHAR (50) NULL,
    [Asset_Date]                                          NVARCHAR (50) NULL,
    [Asset_Value]                                         NVARCHAR (50) NULL,
    [QY_Date]                                             NVARCHAR (50) NULL,
    [ETL_Load_Date]                                       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Maturity_Profile_of_Liquidity_Supply_Charts_Key] ASC)
);

