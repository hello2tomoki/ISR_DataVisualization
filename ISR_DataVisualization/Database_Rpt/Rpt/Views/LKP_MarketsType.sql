CREATE VIEW Rpt.LKP_MarketsType AS
SELECT * FROM 
(VALUES 
(N'Alternative Investments', 'Public Markets',1)
,(N'Segregated Assets', 'Public Markets',2)
,(N'Fixed Income', 'Public Markets',3)
,(N'Equity', 'Public Markets',4)
,(N'Mortgages', 'Private Markets',1)
,(N'Real Estate', 'Private Markets',2)
,(N'Infrastructure and Renewables', 'Private Markets',3)
,(N'Private Equity', 'Private Markets',4)
)
AS X ([Portfolio_Level_3],[MarketsType],[SortBy])
GO