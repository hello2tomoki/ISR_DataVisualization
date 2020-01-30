CREATE TABLE [Stg_Rpt].[FI_Corporate_Exposures] (
    [FI_Corporate_Exposures_Key]                               INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                                  NVARCHAR (50)  NULL,
    [INDUSTRY_SECTOR]                                          NVARCHAR (50)  NULL,
    [Sum_of_Weight_Per_Pf]                                     NVARCHAR (50)  NULL,
    [Sum_of_DV01_Pf]                                           NVARCHAR (50)  NULL,
    [Sum_of_Mkt_Value_Pf]                                      NVARCHAR (50)  NULL,
    [Duration_Contribution_PF]                                 NVARCHAR (50)  NULL,
    [Sum_of_Weight_Per_bmk]                                    NVARCHAR (50)  NULL,
    [Sum_of_Contribution_To_Active_Effective_Duration_NEW_BMK] NVARCHAR (50)  NULL,
    [Effective_Duration_PF_Curve]                              NVARCHAR (50)  NULL,
    [Contribution_To_Effective_Duration_Pf_Curve]              NVARCHAR (50)  NULL,
    [Source]                                                   NVARCHAR (150) NULL,
    [ETL_Load_Date]                                            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Corporate_Exposures_Key] ASC) 
);

