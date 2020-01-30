CREATE TABLE [Stg_Rpt].[Liq_Sunburst] (
    [Liq_Sunburst_Key] INT           IDENTITY (1, 1) NOT NULL,
    [Effective_Date]   NVARCHAR (50) NULL,
    [Type]             NVARCHAR (50) NULL,
    [0-7 Days]         NVARCHAR (50) NULL,
    [8-30 Days]        NVARCHAR (50) NULL,
    [30-90 Days]       NVARCHAR (50) NULL,
    [91-365 Days]      NVARCHAR (50) NULL,
    [More Than 1 Year] NVARCHAR (50) NULL,
    [Source]           NVARCHAR (50) NULL,
    [QY_Date]          DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([Liq_Sunburst_Key] ASC)
);

