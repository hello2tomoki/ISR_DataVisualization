CREATE TABLE [Stg_Rpt].[Infra_Unlisted_Infrastructure_by_Vintage_Year] (
    [Infra_Unlisted_Infrastructure_by_Vintage_Year_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Vintage_Year]                                      NVARCHAR (150) NULL,
    [Top_Quartile_Net_IRR_Boundary]                     NVARCHAR (150) NULL,
    [Median_Net_IRR]                                    NVARCHAR (150) NULL,
    [Bottom_Quartile_Net_IRR_Boundary]                  NVARCHAR (150) NULL,
    [QY_Date]                                           NVARCHAR (150) NULL,
    [Source]                                            NVARCHAR (150) NULL,
    [ETL_Load_Date]                                     DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Unlisted_Infrastructure_by_Vintage_Year_Key] ASC)
);

