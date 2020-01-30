CREATE TABLE [Stg_Rpt].[RE_Fund_Details] (
    [RE_Fund_Details_Key]             INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                         NVARCHAR (50)  NULL,
    [Details_Date]                    NVARCHAR (150) NULL,
    [AUM_as_Per_of_Total_Fund]        NVARCHAR (150) NULL,
    [Risk_Contribution_to_Total_Fund] NVARCHAR (150) NULL,
    [VAR]                             NVARCHAR (150) NULL,
    [Source]                          NVARCHAR (150) NULL,
    [ETL_Load_Date]                   DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([RE_Fund_Details_Key] ASC)
);

