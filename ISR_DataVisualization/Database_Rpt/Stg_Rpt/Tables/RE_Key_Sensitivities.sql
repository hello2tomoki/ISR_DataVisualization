CREATE TABLE [Stg_Rpt].[RE_Key_Sensitivities] (
    [RE_Key_Sensitivities_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                  NVARCHAR (50)  NULL,
    [Metric_Name]              NVARCHAR (150) NULL,
    [Metric_Value]             NVARCHAR (150) NULL,
    [Source]                   NVARCHAR (150) NULL,
    [ETL_Load_Date]            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([RE_Key_Sensitivities_Key] ASC)
);

