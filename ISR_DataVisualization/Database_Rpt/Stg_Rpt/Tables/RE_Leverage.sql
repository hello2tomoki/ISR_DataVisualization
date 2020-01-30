CREATE TABLE [Stg_Rpt].[RE_Leverage] (
    [RE_Leverage_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]         NVARCHAR (50)  NULL,
    [Leverage_Geo]    NVARCHAR (150) NULL,
    [Leverage_Type]   NVARCHAR (150) NULL,
    [Leverage_Value]  NVARCHAR (150) NULL,
    [LTV]             NVARCHAR (150) NULL,
    [Threshold_LTV]   NVARCHAR (150) NULL,
    [Source]          NVARCHAR (150) NULL,
    [ETL_Load_Date]   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([RE_Leverage_Key] ASC)
);

