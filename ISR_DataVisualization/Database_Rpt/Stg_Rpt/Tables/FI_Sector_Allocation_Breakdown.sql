CREATE TABLE [Stg_Rpt].[FI_Sector_Allocation_Breakdown] (
    [FI_Sector_Allocation_Breakdown_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                            NVARCHAR (50)  NULL,
    [Sector]                             NVARCHAR (50)  NULL,
    [PF_Eff_Duration_Contribution]       NVARCHAR (50)  NULL,
    [BMK_Eff_Duration_Contribution]      NVARCHAR (50)  NULL,
    [MV]                                 NVARCHAR (50)  NULL,
    [New_Weights]                        NVARCHAR (50)  NULL,
    [BMK_MV]                             NVARCHAR (50)  NULL,
    [Source]                             NVARCHAR (150) NULL,
    [ETL_Load_Date]                      DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Sector_Allocation_Breakdown_Key] ASC) 
);

