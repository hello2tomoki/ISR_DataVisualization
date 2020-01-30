CREATE TABLE [Stg_Rpt].[PUE_Policy_Wieght] (
    [PUE_Policy_Wieght_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Large_Clients]         NVARCHAR (50) NULL,
    [Actual_Weight]         NVARCHAR (50) NULL,
    [Policy_Weight]         NVARCHAR (50) NULL,
    [Net]                   NVARCHAR (50) NULL,
    [Min_Error]             NVARCHAR (50) NULL,
    [Max_Error]             NVARCHAR (50) NULL,
    [QY_Date]               NVARCHAR (50) NULL,
    [Source]                NVARCHAR (50) NULL,
    [ETL_Load_Date]         DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([PUE_Policy_Wieght_Key] ASC)
);

