CREATE TABLE [Stg_Rpt].[PUE_Total_Equity_MV_by_Mgmt_Style] (
    [PUE_Total_Equity_MV_by_Mgmt_Style_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Wieght_Date]                           NVARCHAR (50) NULL,
    [Internal_Passive]                      NVARCHAR (50) NULL,
    [Internal_Active]                       NVARCHAR (50) NULL,
    [External_Active]                       NVARCHAR (50) NULL,
    [QY_Date]                               NVARCHAR (50) NULL,
    [Source]                                NVARCHAR (50) NULL,
    [ETL_Load_Date]                         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Total_Equity_MV_by_Mgmt_Style_Key] ASC)
);

