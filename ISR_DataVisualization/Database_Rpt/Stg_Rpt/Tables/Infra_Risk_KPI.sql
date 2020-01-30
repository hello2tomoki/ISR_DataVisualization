CREATE TABLE [Stg_Rpt].[Infra_Risk_KPI] (
    [Infra_Risk_KPI_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]            NVARCHAR (50)  NULL,
    [Risk_Type]          NVARCHAR (150) NULL,
    [Risk_Trend]         NVARCHAR (150) NULL,
    [Risk_Level]         NVARCHAR (150) NULL,
    [Source]             NVARCHAR (150) NULL,
    [ETL_Load_Date]      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Risk_KPI_Key] ASC) 
);

