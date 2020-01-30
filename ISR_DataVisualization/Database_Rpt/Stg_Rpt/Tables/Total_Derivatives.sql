CREATE TABLE [Stg_Rpt].[Total_Derivatives] (
    [Total_Derivatives_Key]     INT            IDENTITY (1, 1) NOT NULL,
    [Derivatives]               NVARCHAR (150) NULL,
    [QY_Date]                   DATE           NULL,
    [MTM_(CAD)_Curr]            NVARCHAR (50)  NULL,
    [MTM_(CAD)_Prev_W]          NVARCHAR (50)  NULL,
    [MTM_(CAD)_Prev_M]          NVARCHAR (50)  NULL,
    [Net_Notional_(CAD)_Curr]   NVARCHAR (50)  NULL,
    [Net_Notional_(CAD)_Prev_W] NVARCHAR (50)  NULL,
    [Net_Notional_(CAD)_Prev_M] NVARCHAR (50)  NULL,
    [Source]                    NVARCHAR (50)  NULL,
    [ETL_Load_Date]             DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Total_Derivatives_Key] ASC)
);

