CREATE TABLE [Stg_Rpt].[Liquidity_Risk_Market_Indicators_Short_Term] (
    [Liquidity_Risk_Market_Indicators_Short_Term_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Title]                                           NVARCHAR (150) NULL,
    [Type]                                            NVARCHAR (50)  NULL,
    [Min_Value]                                       NVARCHAR (50)  NULL,
    [Max_Value]                                       NVARCHAR (50)  NULL,
    [Target]                                          NVARCHAR (50)  NULL,
    [Target_Per]                                      NVARCHAR (50)  NULL,
    [QY_Start_Date]                                   NVARCHAR (50)  NULL,
    [QY_Date]                                         NVARCHAR (50)  NULL,
    [Source]                                          NVARCHAR (150) NULL,
    [ETL_Load_Date]                                   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Liquidity_Risk_Market_Indicators_Short_Term_Key] ASC)
);

