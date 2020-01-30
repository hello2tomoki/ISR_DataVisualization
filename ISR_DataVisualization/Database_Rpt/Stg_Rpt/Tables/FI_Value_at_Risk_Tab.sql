CREATE TABLE [Stg_Rpt].[FI_Value_at_Risk_Tab] (
    [FI_Value_at_Risk_Tab_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                  NVARCHAR (50)  NULL,
    [Var_Type]                 NVARCHAR (50)  NULL,
    [Sort_Var_Type]            NVARCHAR (50)  NULL,
    [Factor]                   NVARCHAR (50)  NULL,
    [Sort_Factor]              NVARCHAR (50)  NULL,
    [Value]                    NVARCHAR (50)  NULL,
    [Source]                   NVARCHAR (150) NULL,
    [ETL_Load_Date]            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Value_at_Risk_Tab_Key] ASC) 
);

