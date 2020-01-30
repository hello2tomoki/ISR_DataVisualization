CREATE TABLE [Stg_Rpt].[Liq_CSA_Eligible_Assets_Breakdown_Tablix] (
    [Liq_CSA_Eligible_Assets_Breakdown_Tablix_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Metric]                                       NVARCHAR (50) NULL,
    [GOC_Bonds]                                    NVARCHAR (50) NULL,
    [Provincials]                                  NVARCHAR (50) NULL,
    [QY_Date]                                      NVARCHAR (50) NULL,
    [Source]                                       NVARCHAR (50) NULL,
    [ETL_Load_Date]                                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_CSA_Eligible_Assets_Breakdown_Tablix_Key] ASC)
);

