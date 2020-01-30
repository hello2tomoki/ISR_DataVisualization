CREATE TABLE [Stg_Rpt].[RE_Key_Statics_Tablix] (
    [RE_Risk_KPI_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Metric_Type]     NVARCHAR (150) NULL,
    [Metric_Sub_Type] NVARCHAR (150) NULL,
    [Current_Quarter] NVARCHAR (150) NULL,
    [Growth_Q_Q]      NVARCHAR (150) NULL,
    [Growth_YTD]      NVARCHAR (150) NULL,
    [Target]          NVARCHAR (150) NULL,
    [QY_Date]         NVARCHAR (150) NULL,
    [Source]          NVARCHAR (150) NULL,
    [ETL_Load_Date]   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([RE_Risk_KPI_Key] ASC)
);

