CREATE TABLE [Stg_Rpt].[Liq_Yearly_Stressed_Capital_Calls_by_Currency_Chart] (
    [Liq_Yearly_Stressed_Capital_Calls_by_Currency_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Investment_Type]                                         NVARCHAR (50) NULL,
    [Currency]                                                NVARCHAR (50) NULL,
    [Investment_Value]                                        NVARCHAR (50) NULL,
    [QY_Date]                                                 DATETIME      NULL,
    [Source]                                                  NVARCHAR (50) NULL,
    [ETL_Load_Date]                                           DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Yearly_Stressed_Capital_Calls_by_Currency_Chart_Key] ASC)
);

