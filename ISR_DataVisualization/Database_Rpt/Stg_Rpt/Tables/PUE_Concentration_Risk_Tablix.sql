CREATE TABLE [Stg_Rpt].[PUE_Concentration_Risk_Tablix] (
    [PUE_Concentration_Risk_Tablix_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Top_Holding_Type]                  NVARCHAR (50) NULL,
    [Asset_Name]                        NVARCHAR (50) NULL,
    [Country]                           NVARCHAR (50) NULL,
    [Sector]                            NVARCHAR (50) NULL,
    [Weight_Per]                        NVARCHAR (50) NULL,
    [Active_Weight_Per]                 NVARCHAR (50) NULL,
    [Per_CR_to_Total_Tracking_Error]    NVARCHAR (50) NULL,
    [QY_Date]                           NVARCHAR (50) NULL,
    [Source]                            NVARCHAR (50) NULL,
    [ETL_Load_Date]                     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Concentration_Risk_Tablix_Key] ASC)
);

