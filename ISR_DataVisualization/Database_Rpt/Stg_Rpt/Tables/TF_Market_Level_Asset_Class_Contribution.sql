CREATE TABLE [Stg_Rpt].[TF_Market_Level_Asset_Class_Contribution] (
    [TF_Market_Level_Asset_Class_Contribution_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Description]                                  NVARCHAR (100) NULL,
    [Contribution_Absolute_VaR_(%)]                FLOAT (53)     NULL,
    [CalendarQuarter]                              TINYINT        NULL,
    [CalendarYear]                                 SMALLINT       NULL,
    [DateNo]                                       INT            NOT NULL,
    [QY]                                           NVARCHAR (8)   NOT NULL,
    [QY_Date]                                      DATE           NOT NULL,
    [Total_Var]                                    FLOAT (53)     NULL,
    [Fill]                                         NVARCHAR (7)   NULL,
    [Source]                                       NVARCHAR (50)  NULL,
    [ETL_Load_Date]                                DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([TF_Market_Level_Asset_Class_Contribution_Key] ASC)
);

