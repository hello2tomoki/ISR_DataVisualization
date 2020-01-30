CREATE TABLE [Stg_Rpt].[Derivatives_Counterparty_Exposure_Summary_Institution_Details] (
    [Derivatives_Counterparty_Exposure_Summary_Institution_Details_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                                           NVARCHAR (50)  NULL,
    [Type]                                                              NVARCHAR (150) NULL,
    [INS_Code]                                                          NVARCHAR (150) NULL,
    [INS_Name]                                                          NVARCHAR (50)  NULL,
    [CSA_Threshold_Triparty]                                            NVARCHAR (50)  NULL,
    [Derivative_Type]                                                   NVARCHAR (50)  NULL,
    [Trade_Count]                                                       NVARCHAR (50)  NULL,
    [Net_Market_Value_CAD]                                              NVARCHAR (50)  NULL,
    [Net_Notional_CAD]                                                  NVARCHAR (50)  NULL,
    [Source]                                                            NVARCHAR (150) NULL,
    [ETL_Load_Date]                                                     DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Derivatives_Counterparty_Exposure_Summary_Institution_Details_Key] ASC)
);

