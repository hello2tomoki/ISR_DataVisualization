CREATE TABLE [Stg_Rpt].[PUE_Total_Equity_MV_by_Region] (
    [PUE_Total_Equity_MV_by_Region_Key] INT           IDENTITY (1, 1) NOT NULL,
    [MV_Date]                           NVARCHAR (50) NULL,
    [Canada]                            NVARCHAR (50) NULL,
    [EM]                                NVARCHAR (50) NULL,
    [Global]                            NVARCHAR (50) NULL,
    [QY_Date]                           DATETIME      NULL,
    [Source]                            NVARCHAR (50) NULL,
    [ETL_Load_Date]                     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Total_Equity_MV_by_Region_Key] ASC)
);

