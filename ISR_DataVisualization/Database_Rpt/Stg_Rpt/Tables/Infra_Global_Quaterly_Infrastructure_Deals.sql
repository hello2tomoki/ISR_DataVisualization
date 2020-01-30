CREATE TABLE [Stg_Rpt].[Infra_Global_Quaterly_Infrastructure_Deals] (
    [Infra_Global_Quaterly_Infrastructure_Deals_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Year]                                           NVARCHAR (150) NULL,
    [Quarter]                                        NVARCHAR (150) NULL,
    [Quarter_Date]                                   NVARCHAR (150) NULL,
    [No_of_Deals]                                    NVARCHAR (150) NULL,
    [Aggregate_Deal_Value_$bn]                       NVARCHAR (150) NULL,
    [QY_Date]                                        NVARCHAR (150) NULL,
    [Source]                                         NVARCHAR (150) NULL,
    [ETL_Load_Date]                                  DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Global_Quaterly_Infrastructure_Deals_Key] ASC)
);

