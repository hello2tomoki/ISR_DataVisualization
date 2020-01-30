CREATE TABLE [Stg_Rpt].[Top_Corporate_Exposure] (
    [Top_Country_Exposure_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Issuer]                   NVARCHAR (50) NULL,
    [QY_Date]                  NVARCHAR (50) NULL,
    [Market_Value]             NVARCHAR (50) NULL,
    [Total_Fund_Weight_Per]    NVARCHAR (25) NULL,
    [Source]                   NVARCHAR (50) NULL,
    [ETL_Load_Date]            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Top_Country_Exposure_Key] ASC)
);

