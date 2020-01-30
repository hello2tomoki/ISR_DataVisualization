CREATE TABLE [Stg_Rpt].[SEC_Lending_Collateral] (
    [SEC_Lending_Collateral_Key] INT           IDENTITY (1, 1) NOT NULL,
    [QY_Date]                    VARCHAR (50)  NULL,
    [Total_Debt]                 VARCHAR (50)  NULL,
    [Debt_Breakup]               VARCHAR (50)  NULL,
    [Debt_Per]                   VARCHAR (50)  NULL,
    [Type]                       VARCHAR (150) NULL,
    [Source]                     VARCHAR (50)  NULL,
    [ETL_Load_Date]              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([SEC_Lending_Collateral_Key] ASC)
);

