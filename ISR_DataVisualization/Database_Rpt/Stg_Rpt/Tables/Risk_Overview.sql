CREATE TABLE [Stg_Rpt].[Risk_Overview] (
    [Risk_Overview_Key]   INT           IDENTITY (1, 1) NOT NULL,
    [MarketsType]         VARCHAR (15)  NOT NULL,
    [Description]         VARCHAR (100) NULL,
    [RiskDate]            DATE          NULL,
    [Shock]               VARCHAR (100) NULL,
    [Confidence_Interval] VARCHAR (100) NULL,
    [Evaluate_By]         VARCHAR (100) NULL,
    [RptDateTime]         DATETIME2 (3) NULL,
    [DateKey]             INT           NOT NULL,
    [CalendarQuarter]     TINYINT       NULL,
    [CalendarYear]        SMALLINT      NULL,
    [DateNo]              INT           NOT NULL,
    [QY]                  VARCHAR (8)   NOT NULL,
    [SortBy]              INT           NOT NULL,
    [Metric_Name]         VARCHAR (28)  NOT NULL,
    [Metric_Value]        FLOAT (53)    NULL,
    [Metric_Sort]         INT           NOT NULL,
    [Source]              VARCHAR (50)  NULL,
    [ETL_Load_Date]       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Risk_Overview_Key] ASC)
);

