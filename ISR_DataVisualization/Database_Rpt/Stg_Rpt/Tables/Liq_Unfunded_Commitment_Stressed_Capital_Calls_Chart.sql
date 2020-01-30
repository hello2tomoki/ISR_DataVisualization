CREATE TABLE [Stg_Rpt].[Liq_Unfunded_Commitment_Stressed_Capital_Calls_Chart] (
    [Liq_Unfunded_Commitment_Stressed_Capital_Calls_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Investment_Type]                                          NVARCHAR (50) NULL,
    [One_Yr_Stressed_Capital_Calls]                            NVARCHAR (50) NULL,
    [Unfunded_Commitment]                                      NVARCHAR (50) NULL,
    [QY_Date]                                                  DATETIME      NULL,
    [Source]                                                   NVARCHAR (50) NULL,
    [ETL_Load_Date]                                            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Unfunded_Commitment_Stressed_Capital_Calls_Chart_Key] ASC)
);

