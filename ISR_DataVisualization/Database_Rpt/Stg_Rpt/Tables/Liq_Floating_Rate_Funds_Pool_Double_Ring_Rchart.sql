CREATE TABLE [Stg_Rpt].[Liq_Floating_Rate_Funds_Pool_Double_Ring_Rchart] (
    [Liq_Floating_Rate_Funds_Pool_Double_Ring_Rchart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Pool_Date]                                           NVARCHAR (50) NULL,
    [Type]                                                NVARCHAR (50) NULL,
    [Time_Bucket]                                         NVARCHAR (50) NULL,
    [Bucket_Per]                                          NVARCHAR (50) NULL,
    [QY_Date]                                             NVARCHAR (50) NULL,
    [Source]                                              NVARCHAR (50) NULL,
    [ETL_Load_Date]                                       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Floating_Rate_Funds_Pool_Double_Ring_Rchart_Key] ASC)
);

