CREATE TABLE [Stg_Rpt].[PUE_Performance] (
    [PUE_Performance_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Type]                NVARCHAR (50) NULL,
    [Portfolio]           NVARCHAR (50) NULL,
    [Reference_Portfolio] NVARCHAR (50) NULL,
    [Benchmark]           NVARCHAR (50) NULL,
    [Active]              NVARCHAR (50) NULL,
    [QY_Date]             NVARCHAR (50) NULL,
    [Source]              NVARCHAR (50) NULL,
    [ETL_Load_Date]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Performance_Key] ASC)
);

