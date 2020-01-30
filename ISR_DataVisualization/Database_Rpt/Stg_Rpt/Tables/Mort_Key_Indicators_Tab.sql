CREATE TABLE [Stg_Rpt].[Mort_Key_Indicators_Tab] (
    [Mort_Key_Indicators_Tab_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                     NVARCHAR (150) NULL,
    [As_Of_Date]                  NVARCHAR (150) NULL,
    [Portfolio]                   NVARCHAR (150) NULL,
    [Effective_Duration]          NVARCHAR (150) NULL,
    [Active_Duration]             NVARCHAR (150) NULL,
    [Market_Value]                NVARCHAR (150) NULL,
    [Market_Value_Percentage]     NVARCHAR (150) NULL,
    [DV01_1000]                   NVARCHAR (150) NULL,
    [Source]                      NVARCHAR (150) NULL,
    [ETL_Load_Date]               DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_Key_Indicators_Tab_Key] ASC) ON [Data]
);

