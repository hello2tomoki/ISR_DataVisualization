CREATE TABLE [Stg_Rpt].[Liquidity_Risk_Indicators_Long_Term] (
    [Liquidity_Risk_Indicators_Long_Term_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Month_Date]                              NVARCHAR (50)  NULL,
    [Month]                                   NVARCHAR (50)  NULL,
    [Cash-CDS_Spread]                         NVARCHAR (50)  NULL,
    [Libor-OIS_Spread]                        NVARCHAR (50)  NULL,
    [Barclays_USD_IG_ Liquidity_Cost_Score]   NVARCHAR (50)  NULL,
    [Source]                                  NVARCHAR (150) NULL,
    [ETL_Load_Date]                           DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Liquidity_Risk_Indicators_Long_Term_Key] ASC)
);

