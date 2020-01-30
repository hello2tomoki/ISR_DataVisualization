CREATE TABLE [Stg_Rpt].[PE_Private_Key_Investments] (
    [PE_Private_Key_Investments_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                        NVARCHAR (50)  NULL,
    [Investments_As_of]              NVARCHAR (150) NULL,
    [Portfolio_Type]                 NVARCHAR (150) NULL,
    [Major_Deals_GPs]                NVARCHAR (150) NULL,
    [Market_Value_M]                 NVARCHAR (150) NULL,
    [Industry]                       NVARCHAR (150) NULL,
    [Geography]                      NVARCHAR (150) NULL,
    [Risk_Contribution]              NVARCHAR (150) NULL,
    [Vintage]                        NVARCHAR (150) NULL,
    [Risk_Analysis]                  NVARCHAR (150) NULL,
    [Source]                         NVARCHAR (150) NULL,
    [ETL_Load_Date]                  DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([PE_Private_Key_Investments_Key] ASC)
);

