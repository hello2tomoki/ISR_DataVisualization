CREATE TABLE [Stg_Rpt].[Liq_Floating_Rate_Funds_Pool_Double_Ring_Rchart_] (
    [Liq_Floating_Rate_Funds_Pool_Double_Ring_Rchart__Key] INT           IDENTITY (1, 1) NOT NULL,
    [Pool_Date]                                            NVARCHAR (50) NULL,
    [Type]                                                 NVARCHAR (50) NULL,
    [Time_Bucket]                                          NVARCHAR (50) NULL,
    [Pool_Value]                                           NVARCHAR (50) NULL,
    [QY_Date]                                              NVARCHAR (50) NULL,
    [Source]                                               NVARCHAR (50) NULL,
    [ETL_Load_Date]                                        DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Floating_Rate_Funds_Pool_Double_Ring_Rchart__Key] ASC)
);

