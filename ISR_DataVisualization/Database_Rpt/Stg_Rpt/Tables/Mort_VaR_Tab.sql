CREATE TABLE [Stg_Rpt].[Mort_VaR_Tab] (
    [Mort_VaR_Key]  INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]       NVARCHAR (50)  NULL,
    [As_Of_Date]    NVARCHAR (50)  NULL,
    [Var_Type]      NVARCHAR (50)  NULL,
    [Sort_Var_Type] NVARCHAR (50)  NULL,
    [Factor]        NVARCHAR (50)  NULL,
    [Sort_Factor]   NVARCHAR (50)  NULL,
    [Value]         NVARCHAR (50)  NULL,
    [Source]        NVARCHAR (150) NULL,
    [ETL_Load_Date] DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Mort_VaR_Key] ASC) ON [Data]
);

