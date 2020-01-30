CREATE TABLE [Stg_Rpt].[RE_Portfolio_Diversification] (
    [RE_Portfolio_Diversification_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                          NVARCHAR (50)  NULL,
    [Mertic_Level_1]                   NVARCHAR (150) NULL,
    [Mertic_Level_2]                   NVARCHAR (150) NULL,
    [Mertic_Level_3]                   NVARCHAR (150) NULL,
    [Metric_Value]                     NVARCHAR (150) NULL,
    [Metric_Value_Per]                 NVARCHAR (150) NULL,
    [Target_Per]                       NVARCHAR (150) NULL,
    [Risk_Contribution_Per]            NVARCHAR (150) NULL,
    [Source]                           NVARCHAR (150) NULL,
    [ETL_Load_Date]                    DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([RE_Portfolio_Diversification_Key] ASC)
);

