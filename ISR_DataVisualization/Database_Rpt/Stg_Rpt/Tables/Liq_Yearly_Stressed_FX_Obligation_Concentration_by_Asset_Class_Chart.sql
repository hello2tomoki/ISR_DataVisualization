CREATE TABLE [Stg_Rpt].[Liq_Yearly_Stressed_FX_Obligation_Concentration_by_Asset_Class_Chart] (
    [Liq_Yearly_Stressed_FX_Obligation_Concentration_by_Asset_Class_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Asset]                                                                    NVARCHAR (50) NULL,
    [Yearly_Per]                                                               NVARCHAR (50) NULL,
    [QY_Date]                                                                  NVARCHAR (50) NULL,
    [Source]                                                                   NVARCHAR (50) NULL,
    [ETL_Load_Date]                                                            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Yearly_Stressed_FX_Obligation_Concentration_by_Asset_Class_Chart_Key] ASC)
);

