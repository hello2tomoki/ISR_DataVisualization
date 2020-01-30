CREATE TABLE [Stg_Rpt].[Currency_Exposure_Hedges_Chart] (
    [Currency_Exposure_Hedges_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [QY_Date]                            VARCHAR (50)  NULL,
    [Year]                               VARCHAR (50)  NULL,
    [USA ]                               VARCHAR (50)  NULL,
    [USA_Hedges]                         VARCHAR (50)  NULL,
    [EAFE]                               VARCHAR (50)  NULL,
    [EAFE_Hedges]                        VARCHAR (50)  NULL,
    [EM]                                 VARCHAR (50)  NULL,
    [EM_Hedges]                          VARCHAR (50)  NULL,
    [Source]                             VARCHAR (150) NULL,
    [ETL_Load_Date]                      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Currency_Exposure_Hedges_Chart_Key] ASC)
);

