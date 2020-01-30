CREATE TABLE [Stg_Rpt].[PUE_Total_Fund] (
    [PUE_Total_Fund_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Type]               NVARCHAR (50) NULL,
    [Total_Fund]         NVARCHAR (50) NULL,
    [Public_Equities]    NVARCHAR (50) NULL,
    [Q_O_Q_Change]       NVARCHAR (50) NULL,
    [QY_Date]            NVARCHAR (50) NULL,
    [Source]             NVARCHAR (50) NULL,
    [ETL_Load_Date]      DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Total_Fund_Key] ASC)
);

