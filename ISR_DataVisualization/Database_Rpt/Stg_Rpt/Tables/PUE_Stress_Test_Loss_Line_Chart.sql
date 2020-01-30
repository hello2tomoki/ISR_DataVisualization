CREATE TABLE [Stg_Rpt].[PUE_Stress_Test_Loss_Line_Chart] (
    [PUE_Stress_Test_Loss_Line_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Crash_Date]                          NVARCHAR (50) NULL,
    [Tech_Crash_Equity]                   NVARCHAR (50) NULL,
    [Tech_Crash_Benchmark]                NVARCHAR (50) NULL,
    [GFC_Equity]                          NVARCHAR (50) NULL,
    [GFC_Benchmark]                       NVARCHAR (50) NULL,
    [QY_Date]                             NVARCHAR (50) NULL,
    [Source]                              NVARCHAR (50) NULL,
    [ETL_Load_Date]                       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Stress_Test_Loss_Line_Chart_Key] ASC)
);

