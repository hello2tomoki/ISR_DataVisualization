CREATE TABLE [Stg_Rpt].[Liq_Historical_Market_Value_Area_Chart] (
    [Liq_Historical_Market_Value_Area_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Metric_Date]                                NVARCHAR (50) NULL,
    [Core]                                       NVARCHAR (50) NULL,
    [Non_Core]                                   NVARCHAR (50) NULL,
    [QY_Date]                                    NVARCHAR (50) NULL,
    [Source]                                     NVARCHAR (50) NULL,
    [ETL_Load_Date]                              DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Historical_Market_Value_Area_Chart_Key] ASC)
);

