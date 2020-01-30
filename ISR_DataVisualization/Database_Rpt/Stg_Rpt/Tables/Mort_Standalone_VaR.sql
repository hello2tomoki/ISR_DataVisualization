CREATE TABLE [Stg_Rpt].[Mort_Standalone_VaR] (
    [Mort_Standalone_VaR_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                 NVARCHAR (50)  NULL,
    [As_Of_Date]              NVARCHAR (50)  NULL,
    [Standalone_VaR]          NVARCHAR (50)  NULL,
    [Source]                  NVARCHAR (150) NULL,
    [ETL_Load_Date]           DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_Standalone_VaR_Key] ASC) ON [Data]
);

