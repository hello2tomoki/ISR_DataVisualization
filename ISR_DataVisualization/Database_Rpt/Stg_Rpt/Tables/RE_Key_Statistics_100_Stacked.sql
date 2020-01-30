CREATE TABLE [Stg_Rpt].[RE_Key_Statistics_100_Stacked] (
    [RE_Key_Statistics_100_Stacked_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Market]                            NVARCHAR (150) NULL,
    [Direct]                            NVARCHAR (150) NULL,
    [Indirect]                          NVARCHAR (150) NULL,
    [AUM]                               NVARCHAR (150) NULL,
    [QY_Date]                           NVARCHAR (150) NULL,
    [Source]                            NVARCHAR (150) NULL,
    [ETL_Load_Date]                     DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([RE_Key_Statistics_100_Stacked_Key] ASC)
);

