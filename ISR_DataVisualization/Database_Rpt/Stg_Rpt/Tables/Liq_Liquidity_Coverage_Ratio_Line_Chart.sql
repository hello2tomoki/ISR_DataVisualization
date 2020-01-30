CREATE TABLE [Stg_Rpt].[Liq_Liquidity_Coverage_Ratio_Line_Chart] (
    [Liq_Liquidity_Coverage_Ratio_Line_Chart_Key] INT           IDENTITY (1, 1) NOT NULL,
    [LCR_Date]                                    NVARCHAR (50) NULL,
    [One_Month_LCR]                               NVARCHAR (50) NULL,
    [Projected_One_Month_LCR]                     NVARCHAR (50) NULL,
    [One_Year_LCR]                                NVARCHAR (50) NULL,
    [Projected_One_Year_LCR]                      NVARCHAR (50) NULL,
    [QY_Date]                                     NVARCHAR (50) NULL,
    [Source]                                      NVARCHAR (50) NULL,
    [ETL_Load_Date]                               DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Liquidity_Coverage_Ratio_Line_Chart_Key] ASC)
);

