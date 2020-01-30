CREATE TABLE [Stg_Rpt].[Infra_Risk_Contribution] (
    [Infra_Risk_Contribution_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                     NVARCHAR (50)  NULL,
    [Type]                        NVARCHAR (150) NULL,
    [Sector]                      NVARCHAR (150) NULL,
    [Market_value]                NVARCHAR (150) NULL,
    [Risk_Contribution]           NVARCHAR (150) NULL,
    [Height]                      NVARCHAR (150) NULL,
    [Source]                      NVARCHAR (150) NULL,
    [ETL_Load_Date]               DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Risk_Contribution_Key] ASC)  
);

