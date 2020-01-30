CREATE TABLE [Stg_Rpt].[Mort_Stress_Test] (
    [Mort_Stress_Test_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]              NVARCHAR (150) NULL,
    [Scenario]             NVARCHAR (150) NULL,
    [As_Of_Date]           NVARCHAR (150) NULL,
    [Change]               NVARCHAR (150) NULL,
    [Source]               NVARCHAR (150) NULL,
    [ETL_Load_Date]        DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_Stress_Test_Key] ASC) ON [Data]
);

