CREATE TABLE [Stg_Rpt].[PUE_Top_10_Country_Currency_Exposures] (
    [PUE_Top_10_Country_Currency_Exposures_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Region]                                    NVARCHAR (50) NULL,
    [Country]                                   NVARCHAR (50) NULL,
    [Currency]                                  NVARCHAR (50) NULL,
    [QY_Date]                                   NVARCHAR (50) NULL,
    [Source]                                    NVARCHAR (50) NULL,
    [ETL_Load_Date]                             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Top_10_Country_Currency_Exposures_Key] ASC)
);

