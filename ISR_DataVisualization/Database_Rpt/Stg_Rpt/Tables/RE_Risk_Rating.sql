CREATE TABLE [Stg_Rpt].[RE_Risk_Rating] (
    [RE_Risk_Rating_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]            NVARCHAR (50)  NULL,
    [Risk_Rating]        NVARCHAR (150) NULL,
    [Risk_Rating_Value]  NVARCHAR (150) NULL,
    [Source]             NVARCHAR (150) NULL,
    [ETL_Load_Date]      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([RE_Risk_Rating_Key] ASC)
);

