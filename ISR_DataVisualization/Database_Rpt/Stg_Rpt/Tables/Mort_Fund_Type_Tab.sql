CREATE TABLE [Stg_Rpt].[Mort_Fund_Type_Tab] (
    [Mort_Fund_Type_Tab_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                NVARCHAR (150) NULL,
    [As_Of_Date]             NVARCHAR (150) NULL,
    [Type]                   NVARCHAR (150) NULL,
    [Market_Value]           NVARCHAR (150) NULL,
    [Effective_Duration]     NVARCHAR (150) NULL,
    [DV01_1000]              NVARCHAR (150) NULL,
    [Source]                 NVARCHAR (150) NULL,
    [ETL_Load_Date]          DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_Fund_Type_Tab_Key] ASC) ON [Data]
);

