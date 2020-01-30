CREATE TABLE [Stg_Rpt].[Mort_Porformance_Funds] (
    [Mort_Porformance_Funds_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                    NVARCHAR (50)  NULL,
    [Fund_Type]                  NVARCHAR (150) NULL,
    [Portfolio]                  NVARCHAR (150) NULL,
    [Benchmark]                  NVARCHAR (150) NULL,
    [Active]                     NVARCHAR (150) NULL,
    [TargetExcess_Return]        NVARCHAR (150) NULL,
    [Benchmark_Name]             NVARCHAR (150) NULL,
    [Source]                     NVARCHAR (150) NULL,
    [ETL_Load_Date]              DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_Porformance_Funds_Key] ASC) ON [Data]
);

