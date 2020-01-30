REVOKE  EXECUTE ANY EXTERNAL SCRIPT FROM [Role_DEV];
REVOKE  EXECUTE ANY EXTERNAL SCRIPT FROM [Role_Service_Account];
/*
https://docs.microsoft.com/en-us/sql/advanced-analytics/known-issues-for-sql-server-machine-learning-services?view=sql-server-2017

When you use Visual Studio or SQL Server Data Tools to publish a database project, if any principal has permissions specific to external script execution, you might get an error like this one:
TSQL Model: Error detected when reverse engineering the database. The permission was not recognized and was not imported.
Currently the DACPAC model does not support the permissions used by R Services or Machine Learning Services, such as GRANT ANY EXTERNAL SCRIPT, or EXECUTE ANY EXTERNAL SCRIPT. This issue will be fixed in a later release.
As a workaround, run the additional GRANT statements in a post-deployment script.

*/
