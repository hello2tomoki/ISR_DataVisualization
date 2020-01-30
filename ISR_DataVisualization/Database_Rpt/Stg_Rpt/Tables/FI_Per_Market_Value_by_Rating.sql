CREATE TABLE [Stg_Rpt].[FI_Per_Market_Value_by_Rating] (
    [FI_Per_Market_Value_by_Rating_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                           NVARCHAR (50)  NULL,
    [Type]                              NVARCHAR (50)  NULL,
    [Rating]                            NVARCHAR (50)  NULL,
    [Weights]                           NVARCHAR (50)  NULL,
    [Source]                            NVARCHAR (150) NULL,
    [ETL_Load_Date]                     DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FI_Per_Market_Value_by_Rating_Key] ASC) 
);

