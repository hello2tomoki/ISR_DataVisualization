CREATE TABLE [Stg_Rpt].[FI_Stress_Tests_Sensitivity_Scenerio] (
    [FI_Stress_Tests_Sensitivity_Scenerio_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                  NVARCHAR (50)  NULL,
    [Canada_Housing_Meltdown]                  NVARCHAR (50)  NULL,
    [CAD_Rates_100bps]                         NVARCHAR (50)  NULL,
    [Steepner_100bps]                          NVARCHAR (50)  NULL,
    [Source]                                   NVARCHAR (150) NULL,
    [ETL_Load_Date]                            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Stress_Tests_Sensitivity_Scenerio_Key] ASC) 
);

