CREATE TABLE [Stg_Rpt].[Stress_Impact_On_TF] (
    [Stress_Impact_On_TF_Key]     INT            IDENTITY (1, 1) NOT NULL,
    [Type]                        NVARCHAR (150) NULL,
    [Description]                 NVARCHAR (150) NULL,
    [Standalone_Absolute_VaR_(%)] NVARCHAR (50)  NULL,
    [CalendarQuarter]             NVARCHAR (50)  NULL,
    [CalendarYear]                NVARCHAR (50)  NULL,
    [DateNo]                      NVARCHAR (50)  NULL,
    [QY]                          NVARCHAR (50)  NULL,
    [QY_Date]                     NVARCHAR (50)  NULL,
    [Fill]                        NVARCHAR (50)  NULL,
    [Title_date]                  NVARCHAR (50)  NULL,
    [Source]                      NVARCHAR (50)  NULL,
    [ETL_Load_Date]               DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Stress_Impact_On_TF_Key] ASC)
);

