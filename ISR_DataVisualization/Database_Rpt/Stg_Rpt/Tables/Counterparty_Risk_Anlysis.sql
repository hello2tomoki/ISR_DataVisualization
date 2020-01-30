CREATE TABLE [Stg_Rpt].[Counterparty_Risk_Anlysis] (
    [Counter_Party_Risk_Anlysis_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Threshold]                      VARCHAR (50)  NULL,
    [Rating]                         VARCHAR (50)  NULL,
    [QY_Date]                        VARCHAR (50)  NULL,
    [QY_Title]                       VARCHAR (50)  NULL,
    [Exposure_Type]                  VARCHAR (150) NULL,
    [Bank]                           VARCHAR (150) NULL,
    [Value]                          VARCHAR (50)  NULL,
    [Source]                         VARCHAR (150) NULL,
    [ETL_Load_Date]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Counter_Party_Risk_Anlysis_Key] ASC)
);

