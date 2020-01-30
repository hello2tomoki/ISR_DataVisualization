CREATE TABLE [Stg_Rpt].[Infra_Risk_Contribution_To_Total_Fund] (
    [Infra_Risk_Contribution_To_Total_Fund_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Quarter_Date]                              NVARCHAR (150) NULL,
    [Quarter_Name]                              NVARCHAR (150) NULL,
    [Absolute_Risk]                             NVARCHAR (150) NULL,
    [Risk_Contribution]                         NVARCHAR (150) NULL,
    [QY_Date]                                   NVARCHAR (150) NULL,
    [Source]                                    NVARCHAR (150) NULL,
    [ETL_Load_Date]                             DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Risk_Contribution_To_Total_Fund_Key] ASC)
);

