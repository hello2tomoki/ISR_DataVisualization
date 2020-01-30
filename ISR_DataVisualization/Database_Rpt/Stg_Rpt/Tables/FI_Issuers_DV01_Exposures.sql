CREATE TABLE [Stg_Rpt].[FI_Issuers_DV01_Exposures] (
    [FI_Issuers_DV01_Exposures_Key]             INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                   NVARCHAR (50)  NULL,
    [Issuer]                                    NVARCHAR (50)  NULL,
    [Sum_of_Market_Value]                       NVARCHAR (50)  NULL,
    [Sum_of_Weight]                             NVARCHAR (50)  NULL,
    [Sum_of_DV01]                               NVARCHAR (50)  NULL,
    [Sum_of_Contribution_To_Effective_Duration] NVARCHAR (50)  NULL,
    [Source]                                    NVARCHAR (150) NULL,
    [ETL_Load_Date]                             DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Issuers_DV01_Exposures_Key] ASC) 
);

