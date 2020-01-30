CREATE TABLE [Stg_Rpt].[Total_Fund_FX_Profile](
	[Total_Fund_FX_Profile_Key] [int] IDENTITY(1,1) NOT NULL,
	[Currency] [nvarchar](50) NULL,
	[QY_Date] [nvarchar](50) NULL,
	[BPV_+1bp_IR] [nvarchar](50) NULL,
	[FX_Hedges] [nvarchar](50) NULL,
	[Asset_Exposure ] [nvarchar](50) NULL,
	[Source] [nvarchar](50) NULL,
	[ETL_Load_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Total_Fund_FX_Profile_Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
