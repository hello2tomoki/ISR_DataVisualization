CREATE TABLE [Stg_Rpt].[FI_Stress_Market_Values_and_DV01s_by_Pool] (
    [FI_Stress_Market_Values_and_DV01s_by_Pool_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                       NVARCHAR (50)  NULL,
    [Group]                                         NVARCHAR (50)  NULL,
    [Portfolio]                                     NVARCHAR (50)  NULL,
    [Portfolio_Full_Name]                           NVARCHAR (50)  NULL,
    [Market_Value]                                  NVARCHAR (50)  NULL,
    [DV01]                                          NVARCHAR (50)  NULL,
    [Source]                                        NVARCHAR (150) NULL,
    [ETL_Load_Date]                                 DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Stress_Market_Values_and_DV01s_by_Pool_Key] ASC) 
);

