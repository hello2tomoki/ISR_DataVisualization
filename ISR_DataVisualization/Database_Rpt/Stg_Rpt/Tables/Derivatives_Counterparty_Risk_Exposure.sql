CREATE TABLE [Stg_Rpt].[Derivatives_Counterparty_Risk_Exposure] (
    [Counterparty_Risk_Exposure_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Counterparty_Name]              NVARCHAR (50) NULL,
    [Rating]                         NVARCHAR (50) NULL,
    [QY_Date]                        NVARCHAR (50) NULL,
    [Curr_Month]                     NVARCHAR (50) NULL,
    [Prev_Week]                      NVARCHAR (50) NULL,
    [Prev_Month]                     NVARCHAR (50) NULL,
    [Threshold_(AA-)]                NVARCHAR (50) NULL,
    [Threshold_(A+)]                 NVARCHAR (50) NULL,
    [Threshold_(A)]                  NVARCHAR (50) NULL,
    [Threshold_(A-)]                 NVARCHAR (50) NULL,
    [Threshold_(BBB+)]               NVARCHAR (50) NULL,
    [Source]                         NVARCHAR (50) NULL,
    [ETL_Load_Date]                  DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Counterparty_Risk_Exposure_Key] ASC)
);

