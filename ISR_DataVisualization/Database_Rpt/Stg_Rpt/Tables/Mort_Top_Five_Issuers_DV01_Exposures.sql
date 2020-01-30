CREATE TABLE [Stg_Rpt].[Mort_Top_Five_Issuers_DV01_Exposures] (
    [Mort_Top_Five_Issuers_DV01_Exposures_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                  NVARCHAR (150) NULL,
    [Pool]                                     NVARCHAR (150) NULL,
    [Issuer]                                   NVARCHAR (150) NULL,
    [MV]                                       NVARCHAR (150) NULL,
    [Weight_Percentage]                        NVARCHAR (150) NULL,
    [DV01_1000]                                NVARCHAR (150) NULL,
    [Eff_Duration]                             NVARCHAR (150) NULL,
    [Eff_Duration_Contribution]                NVARCHAR (150) NULL,
    [Source]                                   NVARCHAR (150) NULL,
    [ETL_Load_Date]                            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_Top_Five_Issuers_DV01_Exposures_Key] ASC) ON [Data]
);

