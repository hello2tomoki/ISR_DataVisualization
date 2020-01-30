DROP PROCEDURE IF EXISTS [dim].[CalRowIsCurrentDimPortfolioClientBridge];
DROP PROCEDURE IF EXISTS [dim].[UpdateDimPortfolioClientBridge];
DROP PROCEDURE IF EXISTS [dim].[UpdateDimPortfolioClientBridgeType2];
DROP PROCEDURE IF EXISTS [dim].[UpdateDurableKey_DimPortfolioClientBridge];
DROP TABLE IF EXISTS [dim].[PortfolioClientBridge];
DROP TABLE IF EXISTS [dim].[PortfolioClientBridgeLoad];
DROP TABLE IF EXISTS [fact].[ClientAssetsWeightsReport];
DROP VIEW IF EXISTS [cube].[DIM_PortfolioClientBridge];
