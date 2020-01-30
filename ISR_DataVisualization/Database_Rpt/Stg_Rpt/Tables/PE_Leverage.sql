CREATE TABLE [Stg_Rpt].[PE_Leverage] (
    [PE_Leverage_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]         NVARCHAR (50)  NULL,
    [Year]            NVARCHAR (50)  NULL,
    [Leverage]        NVARCHAR (50)  NULL,
    [Source]          NVARCHAR (150) NULL,
    [ETL_Load_Date]   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([PE_Leverage_Key] ASC)
);

