CREATE TABLE [Stg_Rpt].[Derivatives_FX_Hedging_Program] (
    [Derivatives_FX_Hedging_Program_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                            NVARCHAR (50)  NULL,
    [Hedge_Type]                         NVARCHAR (50)  NULL,
    [Currrency]                          NVARCHAR (50)  NULL,
    [Currrency_Value]                    NVARCHAR (50)  NULL,
    [Type]                               NVARCHAR (50)  NULL,
    [Source]                             NVARCHAR (150) NULL,
    [ETL_Load_Date]                      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Derivatives_FX_Hedging_Program_Key] ASC)
);

