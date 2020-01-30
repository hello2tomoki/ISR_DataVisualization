CREATE TABLE [Stg_Rpt].[FI_Provincial_Exposures] (
    [FI_Provincial_Exposures_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                     NVARCHAR (50)  NULL,
    [Province_Name]               NVARCHAR (50)  NULL,
    [Province_Code]               NVARCHAR (50)  NULL,
    [Debt_Issuance_MS]            NVARCHAR (50)  NULL,
    [BCI_Per_Of_Issue]            NVARCHAR (50)  NULL,
    [Source]                      NVARCHAR (150) NULL,
    [ETL_Load_Date]               DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Provincial_Exposures_Key] ASC) 
);

