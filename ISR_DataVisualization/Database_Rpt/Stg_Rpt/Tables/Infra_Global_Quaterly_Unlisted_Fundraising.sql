CREATE TABLE [Stg_Rpt].[Infra_Global_Quaterly_Unlisted_Fundraising] (
    [Infra_Global_Quaterly_Unlisted_Fundraising_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Year]                                           NVARCHAR (150) NULL,
    [Quarter]                                        NVARCHAR (150) NULL,
    [Quarter_Date]                                   NVARCHAR (150) NULL,
    [No_of_Funds_Closed]                             NVARCHAR (150) NULL,
    [Capital_Raised_$bn]                             NVARCHAR (150) NULL,
    [QY_Date]                                        NVARCHAR (150) NULL,
    [Source]                                         NVARCHAR (150) NULL,
    [ETL_Load_Date]                                  DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([Infra_Global_Quaterly_Unlisted_Fundraising_Key] ASC)
);

