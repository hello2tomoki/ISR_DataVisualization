CREATE TABLE [Stg_Rpt].[Liq_External_Market_Indicators_Tablix] (
    [Liq_External_Market_Indicators_Tablix_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Indicator_Date]                            NVARCHAR (50) NULL,
    [VIX_Index]                                 NVARCHAR (50) NULL,
    [CDX_IG]                                    NVARCHAR (50) NULL,
    [CDX_HY]                                    NVARCHAR (50) NULL,
    [US_10_Yr_2_Yr]                             NVARCHAR (50) NULL,
    [Libor_OIS_Spread_bps]                      NVARCHAR (50) NULL,
    [CDOR_OIS_Spread_bps]                       NVARCHAR (50) NULL,
    [CAD_USD_bps]                               NVARCHAR (50) NULL,
    [MSCI_World_Index_Per]                      NVARCHAR (50) NULL,
    [TED_Spread]                                NVARCHAR (50) NULL,
    [S_and_P_TSX_Index_Per]                     NVARCHAR (50) NULL,
    [NYSE_Daily_Volume_Index_Per]               NVARCHAR (50) NULL,
    [Indicator_Date_CDS]                        NVARCHAR (50) NULL,
    [OAS]                                       NVARCHAR (50) NULL,
    [CDS]                                       NVARCHAR (50) NULL,
    [Cash_CDS_Spread_bps]                       NVARCHAR (50) NULL,
    [QY_Date]                                   NVARCHAR (50) NULL,
    [Source]                                    NVARCHAR (50) NULL,
    [ETL_Load_Date]                             DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_External_Market_Indicators_Tablix_Key] ASC)
);

