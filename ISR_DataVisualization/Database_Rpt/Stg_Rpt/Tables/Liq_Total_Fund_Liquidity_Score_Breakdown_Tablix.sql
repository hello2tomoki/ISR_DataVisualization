CREATE TABLE [Stg_Rpt].[Liq_Total_Fund_Liquidity_Score_Breakdown_Tablix] (
    [Liq_Total_Fund_Liquidity_Score_Breakdown_Tablix_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Type_Col]                                            NVARCHAR (50) NULL,
    [Type_Row]                                            NVARCHAR (50) NULL,
    [Details_Group]                                       NVARCHAR (50) NULL,
    [Details]                                             NVARCHAR (50) NULL,
    [QY_Date]                                             NVARCHAR (50) NULL,
    [Source]                                              NVARCHAR (50) NULL,
    [ETL_Load_Date]                                       DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Total_Fund_Liquidity_Score_Breakdown_Tablix_Key] ASC)
);

