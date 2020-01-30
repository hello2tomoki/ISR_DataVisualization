CREATE TABLE [Stg_Rpt].[Liq_Asset_Quality_Monitoring_Tablix] (
    [Liq_Asset_Quality_Monitoring_Tablix_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Description]                             NVARCHAR (250) NULL,
    [Benchmark]                               NVARCHAR (50)  NULL,
    [Threshold]                               NVARCHAR (50)  NULL,
    [Actual]                                  NVARCHAR (50)  NULL,
    [QY_Date]                                 NVARCHAR (50)  NULL,
    [Source]                                  NVARCHAR (50)  NULL,
    [ETL_Load_Date]                           DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Liq_Asset_Quality_Monitoring_Tablix_Key] ASC)
);

