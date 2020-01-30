--EXECUTE [Rpt].[GetChartBinary]@ChartTitle = 'Provincial - Debt issuance(M$)',@ReportId = 0, @RiskDate = '2018-04-30'
CREATE PROCEDURE [Rpt].[GetChartBinary]
(@ChartTitle VARCHAR(100),
 @ReportId   INT,
 @RiskDate   DATE
)
AS
         BEGIN
             SELECT *
             FROM [Rpt].[ChartBinary] [c]
             WHERE [c].[RiskDate] = @RiskDate
                   AND [c].[ChartTitle] = @ChartTitle
                   AND [c].[ChartBinaryId] =
(
    SELECT MAX([ChartBinaryId])
    FROM [Rpt].[ChartBinary] [c2]
    WHERE [c2].[ChartTitle] = [c].[ChartTitle]
          AND [c2].[ReportId] = [c].[ReportId]
          AND [c2].[RiskDate] = [c].[RiskDate]
);
         END;