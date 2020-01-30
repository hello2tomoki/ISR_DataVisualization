CREATE TABLE [Stg_Rpt].[PUE_Stress_Test_and_VaR_Contribution] (
    [PUE_Stress_Test_and_VaR_Contribution_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Region]                                   NVARCHAR (50) NULL,
    [Tech_Crash_P_and_L_Cont]                  NVARCHAR (50) NULL,
    [GFC_P_and_L_Cont]                         NVARCHAR (50) NULL,
    [Absolute_VaR_Cont]                        NVARCHAR (50) NULL,
    [QY_Date]                                  NVARCHAR (50) NULL,
    [Source]                                   NVARCHAR (50) NULL,
    [ETL_Load_Date]                            DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Stress_Test_and_VaR_Contribution_Key] ASC)
);

