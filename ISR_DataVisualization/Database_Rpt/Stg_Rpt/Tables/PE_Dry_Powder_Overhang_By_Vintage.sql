CREATE TABLE [Stg_Rpt].[PE_Dry_Powder_Overhang_By_Vintage] (
    [PE_Dry_Powder_Overhang_By_Vintage_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                               NVARCHAR (50)  NULL,
    [Year]                                  NVARCHAR (50)  NULL,
    [Overhang_By_Vintage]                   NVARCHAR (50)  NULL,
    [Source]                                NVARCHAR (150) NULL,
    [ETL_Load_Date]                         DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([PE_Dry_Powder_Overhang_By_Vintage_Key] ASC)
);

