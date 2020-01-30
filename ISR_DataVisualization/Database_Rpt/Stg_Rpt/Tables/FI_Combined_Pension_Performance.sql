CREATE TABLE [Stg_Rpt].[FI_Combined_Pension_Performance] (
    [FI_Combined_Pension_Performance_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                             NVARCHAR (50)  NULL,
    [Market_Node_Security]                NVARCHAR (50)  NULL,
    [Portfolio Return]                    NVARCHAR (50)  NULL,
    [Benchmark Return]                    NVARCHAR (50)  NULL,
    [Active Return]                       NVARCHAR (50)  NULL,
    [Source]                              NVARCHAR (150) NULL,
    [ETL_Load_Date]                       DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Combined_Pension_Performance_Key] ASC)
);

