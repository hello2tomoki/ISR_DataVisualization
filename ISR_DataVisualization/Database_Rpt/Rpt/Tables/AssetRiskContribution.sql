CREATE TABLE Rpt.AssetRiskContribution (
  TotalFundName varchar(255),
  AssetClass varchar(255),
  SubAssetClass varchar(255),
  PoolFund varchar(255),
  RiskPortfolioCode varchar(255),
  PV float,
  StandaloneAbsoluteVar float,
  GT_PV float,
  GT_StandaloneAbsoluteVar float
)


--select * from Rpt.AssetRiskContribution