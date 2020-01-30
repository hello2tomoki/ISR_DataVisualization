CREATE TABLE [Stg_Rpt].[FI_Active_Duration_Monthly_Variation] (
    [FI_Active_Duration_Variation_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Portfolio_Code]                   NVARCHAR (50)  NULL,
    [Portfolio_Full_Name]              NVARCHAR (50)  NULL,
    [Active_Eff_Duration]              NVARCHAR (50)  NULL,
    [Active_Credit_Spread_Duration]    NVARCHAR (50)  NULL,
    [QY_Date]                          NVARCHAR (50)  NULL,
    [Source]                           NVARCHAR (150) NULL,
    [ETL_Load_Date]                    DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Active_Duration_Variation_Key] ASC)
);

