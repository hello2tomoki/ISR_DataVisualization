CREATE TABLE [Stg_Rpt].[Liq_Collateral_Coverage_by_the_Floating_Rate_Funds_Pool] (
    [Liq_Collateral_Coverage_by_the_Floating_Rate_Funds_Pool_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Metric]                                                      NVARCHAR (50) NULL,
    [1_Year_Stressed]                                             NVARCHAR (50) NULL,
    [CSA_Eligible_GoC_Bonds]                                      NVARCHAR (50) NULL,
    [CSA_Eligible_Provincials]                                    NVARCHAR (50) NULL,
    [Not_Eligible]                                                NVARCHAR (50) NULL,
    [QY_Date]                                                     NVARCHAR (50) NULL,
    [Source]                                                      NVARCHAR (50) NULL,
    [ETL_Load_Date]                                               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Collateral_Coverage_by_the_Floating_Rate_Funds_Pool_Key] ASC)
);

