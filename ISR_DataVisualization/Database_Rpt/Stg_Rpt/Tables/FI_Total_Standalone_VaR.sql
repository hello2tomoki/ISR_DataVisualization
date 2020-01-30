CREATE TABLE [Stg_Rpt].[FI_Total_Standalone_VaR] (
    [FI_Total Standalone VaR_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                     NVARCHAR (50)  NULL,
    [Total_Standalone_VaR]        NVARCHAR (50)  NULL,
    [Source]                      NVARCHAR (150) NULL,
    [ETL_Load_Date]               DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Total Standalone VaR_Key] ASC) 
);

