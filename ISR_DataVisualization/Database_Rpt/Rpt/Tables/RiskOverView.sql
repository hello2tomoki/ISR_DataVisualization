
CREATE TABLE [Rpt].[RiskOverView](
	[MarketsType] [varchar](15) NOT NULL,
	[RiskDate] [date] NULL,
	[Shock] [varchar](100) NULL,
	[Confidence_Interval] [varchar](100) NULL,
	[Contribution By] [varchar](100) NULL,
	[Description] [varchar](100) NULL,
	[Market_Value] [float] NULL,
	[Market_Value_(%)] [float] NULL,
	[Standalone_Absolute_VaR] [float] NULL,
	[Standalone_Absolute_VaR_(%)] [float] NULL,
	[Contribution_Absolute_VaR] [float] NULL,
	[Contribution_Absolute_VaR_(%)] [float] NULL,
	[Evaluate_By] [varchar](100) NULL,
	[RptDateTime] [datetime] NULL,
	[DateKey] [int] NOT NULL,
	[CalendarQuarter] [tinyint] NULL,
	[CalendarYear] [smallint] NULL,
	[DateNo] [int] NOT NULL,
	[QY] [varchar](8) NOT NULL,
	[SortBy] [int] NOT NULL
) ON [PRIMARY]
GO

--DECLARE @SelectedDate Date = '2018-03-31'

--DECLARE @OffsetPrevious Int = 1

--DECLARE @CurrentQuarterStart date= (SELECT DATEADD(quarter, DATEDIFF(quarter, 0, @SelectedDate), 0));
--DECLARE @CurrentQuarterEnd date= (SELECT DATEADD(quarter, DATEDIFF(quarter, 0, @SelectedDate) + 1, 0));
--DECLARE @PreviousQuarterStart date= (SELECT DATEADD(quarter, DATEDIFF(quarter, 0, @SelectedDate) - @OffsetPrevious, 0));
--DECLARE @PreviousQuarterEnd date= (SELECT DATEADD(quarter, DATEDIFF(quarter, 0, @SelectedDate), -@OffsetPrevious));

--SELECT CASE
--            WHEN [R].[Description] = 'BC IMC Total Plan'
--            THEN 'TF'
--            ELSE ISNULL([L].[MarketsType], 'N/A')
--        END AS [MarketsType],
--        [R].*,
--        [D].[DateKey],
--        [D].[CalendarQuarter],
--        [D].[CalendarYear],
--        [D].[DateNo],
--        CONCAT('Q', [D].[CalendarQuarter], '''', SUBSTRING(CONVERT(CHAR(4), [D].[CalendarYear]), 3, 2)) AS [QY],
--        ISNULL([L].[SortBy], 0) AS [SortBy]

--INTO Rpt.RiskOverView

--FROM
--        [Rpt].[RiskOverView_DAX_Results] [R]
--        LEFT JOIN [Rpt].[LKP_MarketsType] [L]
--        ON [R].[Evaluate_By] = 'DIM_Portfolio[Portfolio_Level_3]'
--        AND [R].[Description] = [L].[Portfolio_Level_3]
--        JOIN [dim].[Date] [D]
--        ON [R].[RiskDate] = [d].[FullDate]
--WHERE [RptDateTime] >=
--		(
--			SELECT MAX([RptDateTime])
--			FROM [Rpt].[RiskOverView_DAX_Results] [R2]
--			WHERE [R].[RiskDate] = [R2].[RiskDate]
--				AND [R].[Shock] = [R2].[Shock]
--				AND [R].[Confidence_Interval] = [R2].[Confidence_Interval]
--				AND [R].[Contribution By] = [R2].[Contribution By]
--				AND [R].[Description] = [R2].[Description]
--		) AND
--[d].[FullDate] BETWEEN @PreviousQuarterStart AND @CurrentQuarterEnd
--ORDER BY [L].[MarketsType] DESC,
--            [L].[SortBy]

--GO

