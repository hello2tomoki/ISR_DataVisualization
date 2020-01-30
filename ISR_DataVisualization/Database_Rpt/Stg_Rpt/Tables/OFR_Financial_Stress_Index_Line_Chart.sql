CREATE TABLE [Stg_Rpt].[OFR_Financial_Stress_Index_Line_Chart] (
    [OFR_Financial_Stress_Line_Chart_Index_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                   NVARCHAR (50)  NULL,
    [MonthOfYear]                               TINYINT        NULL,
    [CalendarYear]                              SMALLINT       NULL,
    [Mon]                                       NVARCHAR (150) NULL,
    [Target]                                    INT            NULL,
    [Month_Key]                                 INT            NULL,
    [Market_Risk_Indicator]                     NVARCHAR (50)  NULL,
    [Source]                                    NVARCHAR (150) NULL,
    [ETL_Load_Date]                             DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([OFR_Financial_Stress_Line_Chart_Index_Key] ASC)
);

