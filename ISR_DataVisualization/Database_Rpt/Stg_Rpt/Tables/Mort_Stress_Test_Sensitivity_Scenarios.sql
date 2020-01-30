CREATE TABLE [Stg_Rpt].[Mort_Stress_Test_Sensitivity_Scenarios] (
    [Mort_Stress_Test_Sensitivity_Scenarios_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                    NVARCHAR (50)  NULL,
    [As_Of_Date]                                 NVARCHAR (50)  NULL,
    [2008-2009_Global_Financial_Crisis]          NVARCHAR (50)  NULL,
    [CAD_Rates_100bps]                           NVARCHAR (50)  NULL,
    [Source]                                     NVARCHAR (150) NULL,
    [ETL_Load_Date]                              DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_Stress_Test_Sensitivity_Scenarios_Key] ASC) ON [Data]
);

