CREATE TABLE [Stg_Rpt].[FI_Pool_Annual_Return] (
    [FI_Pool_Annual_Return_Key]   INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                     NVARCHAR (50)  NULL,
    [Pool]                        NVARCHAR (50)  NULL,
    [Benchmark_Name]              NVARCHAR (250) NULL,
    [Portfolio]                   NVARCHAR (50)  NULL,
    [Benchmark]                   NVARCHAR (50)  NULL,
    [Annual_Excess_Return_Target] NVARCHAR (50)  NULL,
    [Source]                      NVARCHAR (150) NULL,
    [ETL_Load_Date]               DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Pool_Annual_Return_Key] ASC)
);

