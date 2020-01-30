CREATE TABLE [Stg_Rpt].[Liq_Financial_Conditions_Normalized] (
    [Liq_Financial_Conditions_Normalized_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Index_DATE]                              NVARCHAR (50) NULL,
    [Non_Financial_LEVERAGE]                  NVARCHAR (50) NULL,
    [ANFCI]                                   NVARCHAR (50) NULL,
    [Source]                                  NVARCHAR (50) NULL,
    [ETL_Load_Date]                           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Financial_Conditions_Normalized_Key] ASC)
);

