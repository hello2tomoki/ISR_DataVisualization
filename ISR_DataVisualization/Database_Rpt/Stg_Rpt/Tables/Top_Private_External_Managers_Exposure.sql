CREATE TABLE [Stg_Rpt].[Top_Private_External_Managers_Exposure] (
    [Top_Private_External_Managers_Exposure_Key] INT          IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                    VARCHAR (50) NULL,
    [Type]                                       VARCHAR (50) NULL,
    [Manager_Partner]                            VARCHAR (50) NULL,
    [Asset]                                      VARCHAR (50) NULL,
    [NAV_($M)]                                   VARCHAR (50) NULL,
    [Unfunded_($M)]                              VARCHAR (50) NULL,
    [Total]                                      VARCHAR (50) NULL,
    [Source]                                     VARCHAR (50) NULL,
    [ETL_Load_Date]                              DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Top_Private_External_Managers_Exposure_Key] ASC)
);

