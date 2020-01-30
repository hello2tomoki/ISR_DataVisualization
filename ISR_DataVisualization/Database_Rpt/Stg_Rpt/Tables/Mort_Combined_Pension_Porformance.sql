CREATE TABLE [Stg_Rpt].[Mort_Combined_Pension_Porformance] (
    [Mort_Combined_Pension_Porformance_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Market_Node]                           NVARCHAR (150) NULL,
    [Portfolio_Return]                      NVARCHAR (150) NULL,
    [Benchmark_Return]                      NVARCHAR (150) NULL,
    [Active_Return]                         NVARCHAR (150) NULL,
    [QY_Date]                               NVARCHAR (150) NULL,
    [Source]                                NVARCHAR (150) NULL,
    [ETL_Load_Date]                         DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_Combined_Pension_Porformance_Key] ASC) ON [Data]
);

