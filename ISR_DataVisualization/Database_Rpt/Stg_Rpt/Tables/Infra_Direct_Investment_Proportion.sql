CREATE TABLE [Stg_Rpt].[Infra_Direct_Investment_Proportion] (
    [Infra_Direct_Investment_Proportion_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                NVARCHAR (50)  NULL,
    [Year]                                   NVARCHAR (150) NULL,
    [Direct_Investments]                     NVARCHAR (150) NULL,
    [Funds]                                  NVARCHAR (150) NULL,
    [AUM]                                    NVARCHAR (150) NULL,
    [Source]                                 NVARCHAR (150) NULL,
    [ETL_Load_Date]                          DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Direct_Investment_Proportion_Key] ASC)
);

