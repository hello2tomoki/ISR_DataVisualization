CREATE TABLE [Stg_Rpt].[FI_Stress_Tests_Impact] (
    [FI_Stress_Tests_Impact_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                    NVARCHAR (50)  NULL,
    [Stress_Type]                NVARCHAR (50)  NULL,
    [Impact_Type]                NVARCHAR (50)  NULL,
    [Portfolio_Impact]           NVARCHAR (50)  NULL,
    [Source]                     NVARCHAR (150) NULL,
    [ETL_Load_Date]              DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Stress_Tests_Impact_Key] ASC) 
);

