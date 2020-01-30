CREATE TABLE [Stg_Rpt].[Infra_Risk_Adjusted_Returns] (
    [Infra_Risk_Adjusted_Returns_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                         NVARCHAR (50)  NULL,
    [Holdings]                        NVARCHAR (50)  NULL,
    [Realized_SI_IRR]                 NVARCHAR (50)  NULL,
    [Absolute_Risk]                   NVARCHAR (50)  NULL,
    [MV]                              NVARCHAR (50)  NULL,
    [Per_of_Total_Portfolio]          NVARCHAR (50)  NULL,
    [Source]                          NVARCHAR (150) NULL,
    [ETL_Load_Date]                   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Risk_Adjusted_Returns_Key] ASC) 
);

