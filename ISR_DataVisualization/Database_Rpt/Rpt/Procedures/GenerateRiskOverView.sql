/*
EXECUTE [Rpt].[GenerateRiskOverView]
        @ContributionBy = 'Portfolio',
        @EvaluateBy = 'DIM_Portfolio[Portfolio_Level_1]';

EXECUTE [Rpt].[GenerateRiskOverView]
        @ContributionBy = 'Portfolio',
        @EvaluateBy = 'DIM_Portfolio[Portfolio_Level_3]';
*/

CREATE PROCEDURE [Rpt].[GenerateRiskOverView] 
(@ContributionBy NVARCHAR(MAX), @EvaluateBy NVARCHAR(MAX))
AS

BEGIN

DECLARE @DaxSyntax VARCHAR(MAX);
DECLARE @SQLStr NVARCHAR(MAX);

DECLARE @ShockName NVARCHAR(MAX) = 'All Factors Shock';
DECLARE @ConfidenceInterval NVARCHAR(MAX) = 'Lowest 18';
--DECLARE @ContributionBy NVARCHAR(MAX) = 'Portfolio' --'GICSSector'
--DECLARE @EvaluateBy NVARCHAR(MAX) = 'DIM_Portfolio[Portfolio_Level_3]' ; --'DIM_Asset[GICSSector]'


SET @DaxSyntax = '
DEFINE
    VAR Shock = "' + @ShockName + '"
    VAR ConfidenceInterval = "' + @ConfidenceInterval + '"
    VAR ContributionBy = "' + @ContributionBy +'"
EVALUATE
ADDCOLUMNS (
    SUMMARIZECOLUMNS (
        ''''Date''''[DateName],
        DIM_Shock[Shock],
        DIM_ConfidenceInterval[Confidence Interval],
        DIM_ContributionLevel[Contribution By],
' + @EvaluateBy + ',
        FILTER (
            VALUES ( DIM_ConfidenceInterval[Confidence Interval] ),
            ( DIM_ConfidenceInterval[Confidence Interval] = ConfidenceInterval )
        ),
        FILTER (
            VALUES ( DIM_ContributionLevel[Contribution By] ),
            ( DIM_ContributionLevel[Contribution By] = ContributionBy )
        ),
        FILTER ( VALUES ( DIM_Shock[Shock] ), ( DIM_Shock[Shock] = Shock ) ),
        "Market Value", [Market Value],
        "Market Value (%)", [Market Value (%)],
        "Standalone Absolute VaR", [Standalone Absolute VaR],
        "Standalone Absolute VaR (%)", [Standalone Absolute VaR (%)],
        "Contribution Absolute VaR", [Contribution Absolute VaR],
        "Contribution Absolute VaR (%)", [Contribution Absolute VaR (%)]
    ),
    "Evaluate By", "' + @EvaluateBy + '"
)
'


SET @SQLStr = 
'SELECT 
    CONVERT(DATE, CAST([Date[DateName]]] AS VARCHAR(10))),
    CAST([DIM_Shock[Shock]]] AS VARCHAR(100)),
    CAST([DIM_ConfidenceInterval[Confidence Interval]]] AS VARCHAR(100)),
    CAST([DIM_ContributionLevel[Contribution By]]] AS VARCHAR(100)),
    CAST([' + @EvaluateBy + ']] AS VARCHAR(100)),
    [[Market Value]]],
    [[Market Value (%)]]],
    [[Standalone Absolute VaR]]],
    [[Standalone Absolute VaR (%)]]],
    [[Contribution Absolute VaR]]],
    [[Contribution Absolute VaR (%)]]],
   CAST([[Evaluate By]]] AS VARCHAR(100)), 
   GETDATE()
FROM  OPENQUERY(DELTA_ASSET_ANALYSIS, '''+@DaxSyntax+''')'


--DROP TABLE IF EXISTS [Rpt].[RiskOverView_DAX_Results];
--CREATE TABLE [Rpt].[RiskOverView_DAX_Results]
--([RiskDate]                      DATE NULL,
-- [Shock]                         VARCHAR(100) NULL,
-- [Confidence_Interval]           VARCHAR(100) NULL,
-- [Contribution By]               VARCHAR(100) NULL,
-- [Description]                   VARCHAR(100) NULL,
-- [Market_Value]                  [FLOAT] NULL,
-- [Market_Value_(%)]              [FLOAT] NULL,
-- [Standalone_Absolute_VaR]       [FLOAT] NULL,
-- [Standalone_Absolute_VaR_(%)]   [FLOAT] NULL,
-- [Contribution_Absolute_VaR]     [FLOAT] NULL,
-- [Contribution_Absolute_VaR_(%)] [FLOAT] NULL,
-- [Evaluate_By]                   VARCHAR(100) NULL,
-- [RptDateTime]                   DATETIME DEFAULT GETDATE()
--)
--ON [PRIMARY];


--SET @SQLStr = 
--'SELECT * into [Rpt].[RiskOverView_DAX_Results]
--FROM  OPENQUERY(DELTA_ASSET_ANALYSIS, '''+@DaxSyntax+''')'

Print @SQLStr;

--TRUNCATE TABLE [Rpt].[RiskOverView_DAX_Results];
INSERT INTO [Rpt].[RiskOverView_DAX_Results]
EXECUTE [sp_executesql]
        @SQLStr;


SELECT *
FROM [Rpt].[RiskOverView_DAX_Results]
WHERE [RptDateTime] >= (
    SELECT MAX([RptDateTime])
    FROM [Rpt].[RiskOverView_DAX_Results]
)
END;