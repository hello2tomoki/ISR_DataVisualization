CREATE TABLE [Stg_Rpt].[PE_Risk_KPI] (
    [PE_Risk_KPI_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]         NVARCHAR (50)  NULL,
    [Type]            NVARCHAR (150) NULL,
    [Risk_Type]       NVARCHAR (150) NULL,
    [Risk_Trend]      NVARCHAR (150) NULL,
    [Risk_Level]      NVARCHAR (150) NULL,
    [Source]          NVARCHAR (150) NULL,
    [ETL_Load_Date]   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([PE_Risk_KPI_Key] ASC)
);

