CREATE TABLE [Stg_Rpt].[PUE_External_Manager_Exposures] (
    [PUE_External_Manager_Exposures_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Market]                             NVARCHAR (50) NULL,
    [Active_EM]                          NVARCHAR (50) NULL,
    [Active_Asia]                        NVARCHAR (50) NULL,
    [Active_Canadian]                    NVARCHAR (50) NULL,
    [Canadian_Quant_Active]              NVARCHAR (50) NULL,
    [Active_Europe]                      NVARCHAR (50) NULL,
    [QY_Date]                            NVARCHAR (50) NULL,
    [Source]                             NVARCHAR (50) NULL,
    [ETL_Load_Date]                      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_External_Manager_Exposures_Key] ASC)
);

