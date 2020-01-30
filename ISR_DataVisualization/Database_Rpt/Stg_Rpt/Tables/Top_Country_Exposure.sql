CREATE TABLE [Stg_Rpt].[Top_Country_Exposure] (
    [Top_Country_Exposure_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Country_Name]            NVARCHAR (50)  NULL,
    [Country_Code]            NVARCHAR (50)  NULL,
    [QY_Date]                 NVARCHAR (25) NULL,
    [Metric_Name]             NVARCHAR (50)  NULL,
    [Metric_Value]             NVARCHAR (50)  NULL,
    [Source]                  NVARCHAR (50)  NULL,
    [ETL_Load_Date]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Top_Country_Exposure_Key] ASC)
);


