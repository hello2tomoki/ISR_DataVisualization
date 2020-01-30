CREATE TABLE [Stg_Rpt].[Mort_Key_Rate_Duration_Contribution] (
    [Mort_Key_Rate_Duration_Contribution_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                 NVARCHAR (50)  NULL,
    [As_Of_Date]                              NVARCHAR (50)  NULL,
    [Pillar]                                  NVARCHAR (50)  NULL,
    [KRD_Contribution]                        NVARCHAR (50)  NULL,
    [Source]                                  NVARCHAR (150) NULL,
    [ETL_Load_Date]                           DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_Key_Rate_Duration_Contribution_Key] ASC) ON [Data]
);

