CREATE TABLE [Stg_Rpt].[Liq_Demand_Profile_Derivatives_by_Maturity_Bucket] (
    [Liq_Demand_Profile_Derivatives_by_Maturity_Bucket_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Tablix_Type]                                           NVARCHAR (50) NULL,
    [Derivative_Type]                                       NVARCHAR (50) NULL,
    [Current_Date]                                          NVARCHAR (50) NULL,
    [Bucket]                                                NVARCHAR (50) NULL,
    [Curr_Demand_Value]                                     NVARCHAR (50) NULL,
    [Previous_Date]                                         NVARCHAR (50) NULL,
    [Prev_Demand_Value]                                     NVARCHAR (50) NULL,
    [QY_Date]                                               DATETIME      NULL,
    [Source]                                                NVARCHAR (50) NULL,
    [ETL_Load_Date]                                         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Demand_Profile_Derivatives_by_Maturity_Bucket_Key] ASC)
);

