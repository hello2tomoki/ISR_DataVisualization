CREATE TABLE [Stg_Rpt].[PUE_Wieght_Column_Chart] (
    [PUE_Wieght_Column_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Wieght_Date]                 NVARCHAR (50) NULL,
    [Active_Cumulative]           NVARCHAR (50) NULL,
    [Active_Period]               NVARCHAR (50) NULL,
    [Style]                       NVARCHAR (50) NULL,
    [Industry]                    NVARCHAR (50) NULL,
    [Stocks_Selection]            NVARCHAR (50) NULL,
    [Currency]                    NVARCHAR (50) NULL,
    [Country]                     NVARCHAR (50) NULL,
    [World]                       NVARCHAR (50) NULL,
    [QY_Date]                     DATETIME      NULL,
    [Source]                      NVARCHAR (50) NULL,
    [ETL_Load_Date]               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Wieght_Column_Chart_Key] ASC)
);

