CREATE TABLE [Stg_Rpt].[Liq_Debt_Obligation_By_Maturity_Chart] (
    [Liq_Debt_Obligation_By_Maturity_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Debt_Date]                                 NVARCHAR (50) NULL,
    [Debt_Bucket]                               NVARCHAR (50) NULL,
    [Debt_Value]                                NVARCHAR (50) NULL,
    [QY_Date]                                   DATETIME      NULL,
    [Source]                                    NVARCHAR (50) NULL,
    [ETL_Load_Date]                             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Debt_Obligation_By_Maturity_Chart_Key] ASC)
);

