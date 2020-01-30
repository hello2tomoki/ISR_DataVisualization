CREATE TABLE [Stg_Rpt].[FI_Duration_by_Bucket_KRD] (
    [FI_Duration_by_Bucket_KRD_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                       NVARCHAR (50)  NULL,
    [Pillar]                        NVARCHAR (50)  NULL,
    [Portfolio_KRD]                 NVARCHAR (50)  NULL,
    [Active_KRD]                    NVARCHAR (50)  NULL,
    [Source]                        NVARCHAR (150) NULL,
    [ETL_Load_Date]                 DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Duration_by_Bucket_KRD_Key] ASC) 
);

