CREATE TABLE [Stg_Rpt].[FI_Credit_Exposures_by_Rating] (
    [FI_Credit_Exposures_by_Rating_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                           NVARCHAR (50)  NULL,
    [Rating]                            NVARCHAR (50)  NULL,
    [Eff_Duration_Curr]                 NVARCHAR (50)  NULL,
    [Eff_Duration_Prev]                 NVARCHAR (50)  NULL,
    [CS_Duration_Curr]                  NVARCHAR (50)  NULL,
    [CS_Duration_Prev]                  NVARCHAR (50)  NULL,
    [Active_Weight_Curr]                NVARCHAR (50)  NULL,
    [Active_Weight_Prev]                NVARCHAR (50)  NULL,
    [Source]                            NVARCHAR (150) NULL,
    [ETL_Load_Date]                     DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Credit_Exposures_by_Rating_Key] ASC) 
);


