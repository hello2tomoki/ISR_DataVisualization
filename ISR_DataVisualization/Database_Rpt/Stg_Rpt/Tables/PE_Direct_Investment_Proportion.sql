CREATE TABLE [Stg_Rpt].[PE_Direct_Investment_Proportion] (
    [PE_Direct_Investment_Proportion_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                             NVARCHAR (50)  NULL,
    [Year]                                NVARCHAR (150) NULL,
    [Direct_Investments]                  NVARCHAR (150) NULL,
    [Co_Investments]                      NVARCHAR (150) NULL,
    [Funds]                               NVARCHAR (150) NULL,
    [Clients_Ownership]                   NVARCHAR (150) NULL,
    [AUM]                                 NVARCHAR (150) NULL,
    [Source]                              NVARCHAR (150) NULL,
    [ETL_Load_Date]                       DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([PE_Direct_Investment_Proportion_Key] ASC)
);

