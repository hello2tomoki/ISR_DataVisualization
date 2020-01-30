CREATE TABLE [Stg_Rpt].[Stressed_Liquidity_Coverage_Ratios] (
    [Stressed_Liquidity_Coverage_Ratios_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                VARCHAR (50)   NULL,
    [QY]                                     VARCHAR (50)   NULL,
    [Core]                                   VARCHAR (50)   NULL,
    [Projected_Core]                         VARCHAR (50)   NULL,
    [Core_Plus]                              VARCHAR (50)   NULL,
    [Projected_Core_Plus]                    VARCHAR (50)   NULL,
    [Core_Limit]                             VARCHAR (50)   NULL,
    [Core_Plus_Limit]                        VARCHAR (50)   NULL,
    [Source]                                 NVARCHAR (150) NULL,
    [ETL_Load_Date]                          DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Stressed_Liquidity_Coverage_Ratios_Key] ASC)
);

