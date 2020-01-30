CREATE TABLE [Stg_Rpt].[FI_Bench_Credit_Spread_Duration_Contribution] (
    [FI_Bench_Credit_Spread_Duration_Contribution_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                                          NVARCHAR (50)  NULL,
    [Portfolio]                                        NVARCHAR (50)  NULL,
    [Portfolio_Full_Name]                              NVARCHAR (50)  NULL,
    [PF_Bench_CS_Duration_Contribution]                NVARCHAR (50)  NULL,
    [Source]                                           NVARCHAR (150) NULL,
    [ETL_Load_Date]                                    DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Bench_Credit_Spread_Duration_Contribution_Key] ASC)
	);

