CREATE TABLE [Stg_Rpt].[Infra_Intrest_Rate_Sensivity] (
    [Infra_Intrest_Rate_Sensivity_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                          NVARCHAR (50)  NULL,
    [Top_Investments]                  NVARCHAR (150) NULL,
    [Sensitivity_To_Interest_Rate]     NVARCHAR (150) NULL,
    [Source]                           NVARCHAR (150) NULL,
    [ETL_Load_Date]                    DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Intrest_Rate_Sensivity_Key] ASC)
);

