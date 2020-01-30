CREATE TABLE [Stg_Rpt].[PUE_Active_Risk_Cintributor_Column_Chart] (
    [PUE_Active_Risk_Cintributor_Column_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Risk_Date]                                    NVARCHAR (50) NULL,
    [Active_Risk]                                  NVARCHAR (50) NULL,
    [Country]                                      NVARCHAR (50) NULL,
    [Style]                                        NVARCHAR (50) NULL,
    [Industry]                                     NVARCHAR (50) NULL,
    [Stock_Selection]                              NVARCHAR (50) NULL,
    [Currency]                                     NVARCHAR (50) NULL,
    [World]                                        NVARCHAR (50) NULL,
    [QY_Date]                                      NVARCHAR (50) NULL,
    [Source]                                       NVARCHAR (50) NULL,
    [ETL_Load_Date]                                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Active_Risk_Cintributor_Column_Chart_Key] ASC)
);

