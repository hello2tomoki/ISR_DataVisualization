CREATE TABLE [Stg_Rpt].[PUE_Active_Wieght_Tablix] (
    [PUE_Active_Wieght_Tablix_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Wieght]                       NVARCHAR (50) NULL,
    [Country]                      NVARCHAR (50) NULL,
    [Total]                        NVARCHAR (50) NULL,
    [Communication]                NVARCHAR (50) NULL,
    [Cons_Disc]                    NVARCHAR (50) NULL,
    [Cons_Staples]                 NVARCHAR (50) NULL,
    [Energy]                       NVARCHAR (50) NULL,
    [Financials]                   NVARCHAR (50) NULL,
    [Health_Care]                  NVARCHAR (50) NULL,
    [Industrials]                  NVARCHAR (50) NULL,
    [IT]                           NVARCHAR (50) NULL,
    [Materials]                    NVARCHAR (50) NULL,
    [Real_Estate]                  NVARCHAR (50) NULL,
    [Utilities]                    NVARCHAR (50) NULL,
    [QY_Date]                      NVARCHAR (50) NULL,
    [Source]                       NVARCHAR (50) NULL,
    [ETL_Load_Date]                DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Active_Wieght_Tablix_Key] ASC)
);

