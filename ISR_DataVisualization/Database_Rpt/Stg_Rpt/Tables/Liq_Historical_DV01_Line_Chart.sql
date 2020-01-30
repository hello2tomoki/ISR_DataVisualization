CREATE TABLE [Stg_Rpt].[Liq_Historical_DV01_Line_Chart] (
    [Liq_Historical_DV01_Line_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Asset_Type]                         NVARCHAR (50) NULL,
    [Core]                               NVARCHAR (50) NULL,
    [Asset_Date]                         NVARCHAR (50) NULL,
    [Asset_Value]                        NVARCHAR (50) NULL,
    [QY_Date]                            NVARCHAR (50) NULL,
    [Source]                             NVARCHAR (50) NULL,
    [ETL_Load_Date]                      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Historical_DV01_Line_Chart_Key] ASC)
);

