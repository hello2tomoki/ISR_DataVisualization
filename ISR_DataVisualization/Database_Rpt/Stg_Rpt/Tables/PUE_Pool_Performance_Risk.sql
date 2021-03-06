CREATE TABLE [Stg_Rpt].[PUE_Pool_Performance_Risk] (
    [Pool_Performance_Risk_Key]          INT           IDENTITY (1, 1) NOT NULL,
    [Mgmt_Style]                         NVARCHAR (50) NULL,
    [Region]                             NVARCHAR (50) NULL,
    [Pool_Name]                          NVARCHAR (50) NULL,
    [MV_$B]                              NVARCHAR (50) NULL,
    [Per_of_Total_Equity_MV]             NVARCHAR (50) NULL,
    [Pool]                               NVARCHAR (50) NULL,
    [Benchmark_Value]                    NVARCHAR (50) NULL,
    [Active]                             NVARCHAR (50) NULL,
    [Annual_excess_return_target]        NVARCHAR (50) NULL,
    [Cont_to_Total_Equity_Active_Return] NVARCHAR (50) NULL,
    [IR_Active_Return_TE]                NVARCHAR (50) NULL,
    [Active_Share]                       NVARCHAR (50) NULL,
    [Forecast_Tracking_Error]            NVARCHAR (50) NULL,
    [Cont_to_Total_Equity_TE]            NVARCHAR (50) NULL,
    [Active_VaR]                         NVARCHAR (50) NULL,
    [Cont_to_Total_Equity_Active_VaR]    NVARCHAR (50) NULL,
    [Benchmark_Name]                     NVARCHAR (50) NULL,
    [QY_Date]                            DATETIME      NULL,
    [Source]                             NVARCHAR (50) NULL,
    [ETL_Load_Date]                      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Pool_Performance_Risk_Key] ASC)
);

