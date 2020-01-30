CREATE TABLE [Stg_Rpt].[Liq_KPI_Threshold] (
    [Liq_KPI_Threshold_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Visual]                NVARCHAR (50) NULL,
    [Metric]                NVARCHAR (50) NULL,
    [Change]                NVARCHAR (50) NULL,
    [Threshold_1]           NVARCHAR (50) NULL,
    [Threshold_2]           NVARCHAR (50) NULL,
    [Color]                 NVARCHAR (50) NULL,
    [Color_Code]            NVARCHAR (50) NULL,
    [Source]                NVARCHAR (50) NULL,
    [ETL_Load_Date]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_KPI_Threshold_Key] ASC)
);

