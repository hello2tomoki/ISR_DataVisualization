CREATE TABLE [Stg_Rpt].[PE_Private_Equity_Portfolio] (
    [PE_Private_Equity_Portfolio_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                         NVARCHAR (50)  NULL,
    [Investments_As_of]               NVARCHAR (150) NULL,
    [Portfolio_Type]                  NVARCHAR (150) NULL,
    [Investment_Type]                 NVARCHAR (150) NULL,
    [Market_Value_M]                  NVARCHAR (150) NULL,
    [Unfunded_Commitments]            NVARCHAR (150) NULL,
    [VaR_Per]                         NVARCHAR (150) NULL,
    [Risk_Contribution]               NVARCHAR (150) NULL,
    [Incremental_Risk]                NVARCHAR (150) NULL,
    [IRR]                             NVARCHAR (150) NULL,
    [Source]                          NVARCHAR (150) NULL,
    [ETL_Load_Date]                   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([PE_Private_Equity_Portfolio_Key] ASC)
);

