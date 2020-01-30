CREATE TABLE [Stg_Rpt].[Infra_Key_Investments] (
    [Infra_Private_Key_Investments_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                           NVARCHAR (50)  NULL,
    [Portfolio_Type]                    NVARCHAR (150) NULL,
    [Major_Deals_GPs]                   NVARCHAR (150) NULL,
    [Market_Value_M]                    NVARCHAR (150) NULL,
    [Industry]                          NVARCHAR (150) NULL,
    [Geography]                         NVARCHAR (150) NULL,
    [Risk_Contribution]                 NVARCHAR (150) NULL,
    [Vintage_Year]                      NVARCHAR (150) NULL,
    [Risk_Analysis]                     NVARCHAR (150) NULL,
    [Source]                            NVARCHAR (150) NULL,
    [ETL_Load_Date]                     DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Private_Key_Investments_Key] ASC) 
);

