CREATE TABLE [Stg_Rpt].[PUE_Active_Risk_Bubble_Chart] (
    [PUE_Active_Risk_Bubble_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Pool]                             NVARCHAR (50) NULL,
    [Tracking_Error]                   NVARCHAR (50) NULL,
    [Cont_to_Public_Equity_TE]         NVARCHAR (50) NULL,
    [Mkt_Value]                        NVARCHAR (50) NULL,
    [QY_Date]                          DATETIME      NULL,
    [Source]                           NVARCHAR (50) NULL,
    [ETL_Load_Date]                    DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Active_Risk_Bubble_Chart_Key] ASC)
);

