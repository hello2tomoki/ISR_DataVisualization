CREATE TABLE [Stg_Rpt].[PE_Total_Equity_MV_by_Mgmt_style] (
    [PE_Total_Equity_MV_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                NVARCHAR (50)  NULL,
    [Total ]                 NVARCHAR (50)  NULL,
    [External ]              NVARCHAR (50)  NULL,
    [Ext_Active ]            NVARCHAR (50)  NULL,
    [Internal ]              NVARCHAR (50)  NULL,
    [Int_Active ]            NVARCHAR (50)  NULL,
    [Int_Passive ]           NVARCHAR (50)  NULL,
    [Source]                 NVARCHAR (150) NULL,
    [ETL_Load_Date]          DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([PE_Total_Equity_MV_Key] ASC)
);

