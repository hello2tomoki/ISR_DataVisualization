CREATE TABLE [Stg_Rpt].[RE_Return] (
    [RE_Return_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]       NVARCHAR (50)  NULL,
    [Return_Type]   NVARCHAR (150) NULL,
    [Geography]     NVARCHAR (150) NULL,
    [Return]        NVARCHAR (150) NULL,
    [Source]        NVARCHAR (150) NULL,
    [ETL_Load_Date] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([RE_Return_Key] ASC)
);

