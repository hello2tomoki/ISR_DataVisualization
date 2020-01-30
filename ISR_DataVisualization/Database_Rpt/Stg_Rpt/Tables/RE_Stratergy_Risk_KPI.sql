CREATE TABLE [Stg_Rpt].[RE_Stratergy_Risk_KPI] (
    [RE_Stratergy_KPI_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]              NVARCHAR (50)  NULL,
    [Risk_Type]            NVARCHAR (150) NULL,
    [Risk_Level]           NVARCHAR (150) NULL,
    [Source]               NVARCHAR (150) NULL,
    [ETL_Load_Date]        DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([RE_Stratergy_KPI_Key] ASC)
);

