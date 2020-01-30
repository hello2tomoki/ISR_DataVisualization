CREATE TABLE [Stg_Rpt].[Infra_Unlisted_Infrastructure_Dry_Powder_by_Fund_Size] (
    [Infra_Unlisted_Infrastructure_Dry_Powder_by_Fund_Size_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Date]                                                      NVARCHAR (150) NULL,
    [Mega_Funds:_$2bn_or_More]                                  NVARCHAR (150) NULL,
    [Large_Funds:_$1-1.9bn]                                     NVARCHAR (150) NULL,
    [Medium_Funds:_$500-999mn]                                  NVARCHAR (150) NULL,
    [Small_Funds:_Less_than_$500mn]                             NVARCHAR (150) NULL,
    [QY_Date]                                                   NVARCHAR (150) NULL,
    [Source]                                                    NVARCHAR (150) NULL,
    [ETL_Load_Date]                                             DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Unlisted_Infrastructure_Dry_Powder_by_Fund_Size_Key] ASC)
);

