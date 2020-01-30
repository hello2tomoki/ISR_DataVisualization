CREATE TABLE [Stg_Rpt].[FI_Currency_Exposure] (
    [FI_Currency_Exposure_Key]                         INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                          NVARCHAR (50)  NULL,
    [Currency]                                         NVARCHAR (50)  NULL,
    [Market_Value]                                     NVARCHAR (50)  NULL,
    [New_Market_Value]                                 NVARCHAR (50)  NULL,
    [Bench_Market_Value]                               NVARCHAR (50)  NULL,
    [Contribution_To_Effective_Duration_NEW_Portfolio] NVARCHAR (50)  NULL,
    [Contribution_To_Effective_Duration_NEW_BenchMark] NVARCHAR (50)  NULL,
    [Source]                                           NVARCHAR (150) NULL,
    [ETL_Load_Date]                                    DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Currency_Exposure_Key] ASC) 
);

