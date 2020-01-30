CREATE TABLE [Stg_Rpt].[Top_Currency_Fx_Fwd] (
    [Top_Currency_Fx_Fwd_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Currency]                NVARCHAR (50) NULL,
    [QY_Date]                 NVARCHAR (50) NULL,
    [Net_Notional_Curr]       NVARCHAR (50) NULL,
    [Net_Notional_Prev_W]     NVARCHAR (50) NULL,
    [Net_Notional_Prev_M]     NVARCHAR (50) NULL,
    [Source]                  NVARCHAR (50) NULL,
    [ETL_Load_Date]           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Top_Currency_Fx_Fwd_Key] ASC)
);

