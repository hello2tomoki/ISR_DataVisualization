CREATE TABLE [Stg_Rpt].[Infra_Interest_Rate_Sensitivity] (
    [Infra_Interest_Rate_Sensitivity_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Top_10]                              NVARCHAR (150) NULL,
    [Sensitivity_To_Interest_Rate]        NVARCHAR (150) NULL,
    [QY_Date]                             NVARCHAR (150) NULL,
    [Source]                              NVARCHAR (150) NULL,
    [ETL_Load_Date]                       DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Interest_Rate_Sensitivity_Key] ASC)
);

