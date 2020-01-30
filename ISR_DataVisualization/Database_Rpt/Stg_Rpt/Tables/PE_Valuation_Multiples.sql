CREATE TABLE [Stg_Rpt].[PE_Valuation_Multiples] (
    [PE_Valuation_Multiples_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                    NVARCHAR (50)  NULL,
    [Year]                       NVARCHAR (50)  NULL,
    [Senior_Debt_EBITDA]         NVARCHAR (50)  NULL,
    [Sub_Debt_EBITDA]            NVARCHAR (50)  NULL,
    [Equity_EBITDA]              NVARCHAR (50)  NULL,
    [Others]                     NVARCHAR (50)  NULL,
    [Total]                      NVARCHAR (50)  NULL,
    [Debt_EBITDA]                NVARCHAR (50)  NULL,
    [Equity_EBITDA_Cal]          NVARCHAR (50)  NULL,
    [Source]                     NVARCHAR (150) NULL,
    [ETL_Load_Date]              DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([PE_Valuation_Multiples_Key] ASC)
);

