CREATE TABLE [Stg_Rpt].[PE_US_Backed_Exits] (
    [PE_US_Backed Exits_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                NVARCHAR (50)  NULL,
    [Year]                   NVARCHAR (50)  NULL,
    [Secondary_Buyout]       NVARCHAR (50)  NULL,
    [Strategic_Acquisition]  NVARCHAR (50)  NULL,
    [Source]                 NVARCHAR (150) NULL,
    [ETL_Load_Date]          DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([PE_US_Backed Exits_Key] ASC)
);

