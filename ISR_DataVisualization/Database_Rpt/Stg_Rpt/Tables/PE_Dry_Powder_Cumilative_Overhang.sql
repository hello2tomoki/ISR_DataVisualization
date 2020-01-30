CREATE TABLE [Stg_Rpt].[PE_Dry_Powder_Cumilative_Overhang] (
    [PE_Dry_Powder_Cumilative_Overhang_Key] INT            IDENTITY (1, 1) NOT NULL,
    [QY_Date]                               NVARCHAR (50)  NULL,
    [Year]                                  NVARCHAR (50)  NULL,
    [Cumilative_Overhang]                   NVARCHAR (50)  NULL,
    [Source]                                NVARCHAR (150) NULL,
    [ETL_Load_Date]                         DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([PE_Dry_Powder_Cumilative_Overhang_Key] ASC)
);

