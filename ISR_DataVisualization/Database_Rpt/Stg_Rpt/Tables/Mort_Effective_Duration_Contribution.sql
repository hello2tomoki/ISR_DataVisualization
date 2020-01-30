CREATE TABLE [Stg_Rpt].[Mort_Effective_Duration_Contribution] (
    [Mort_Effective_Duration_Contribution_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                  NVARCHAR (50)  NULL,
    [Fund]                                     NVARCHAR (50)  NULL,
    [Duration]                                 NVARCHAR (50)  NULL,
    [Source]                                   NVARCHAR (150) NULL,
    [ETL_Load_Date]                            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_Effective_Duration_Contribution_Key] ASC) ON [Data]
);

