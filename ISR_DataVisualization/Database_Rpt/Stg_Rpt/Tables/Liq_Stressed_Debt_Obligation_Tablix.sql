CREATE TABLE [Stg_Rpt].[Liq_Stressed_Debt_Obligation_Tablix] (
    [Liq_Stressed_Debt_Obligation_Tablix_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Lender]                                  NVARCHAR (50) NULL,
    [Outstanding_Balance]                     NVARCHAR (50) NULL,
    [Yearly_Stressed]                         NVARCHAR (50) NULL,
    [QY_Date]                                 DATETIME      NULL,
    [Source]                                  NVARCHAR (50) NULL,
    [ETL_Load_Date]                           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Stressed_Debt_Obligation_Tablix_Key] ASC)
);

