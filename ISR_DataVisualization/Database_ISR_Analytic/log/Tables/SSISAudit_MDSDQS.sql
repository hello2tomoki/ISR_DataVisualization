CREATE TABLE [log].[SSISAudit_MDSDQS] (
    [BatchID]                    INT            DEFAULT ((-1)) NULL,
    [SSISAuditKey]               INT            IDENTITY (1, 1) NOT NULL,
    [PackageName]                [sysname]      NOT NULL,
    [RunBy]                      [sysname]      DEFAULT (suser_sname()) NOT NULL,
    [LineageTMST]                DATETIME       DEFAULT (getdate()) NOT NULL,
    [CompleteTMST]               DATETIME       NULL,
    [DurationSecond]             AS             (case when datepart(year,[LineageTMST])>(1753) AND datepart(year,[CompleteTMST])>(1753) then datediff(second,[LineageTMST],[CompleteTMST])  end),
    [CompletionMessage]          VARCHAR (512)  NULL,
    [ExecutionInstanceGUID]      NVARCHAR (100) NULL,
    [MDSImportType]              INT            NULL,
    [MDSBatchTag]                VARCHAR (100)  NULL,
    [MDSVersionName]             VARCHAR (100)  NULL,
    [MDSLogFlag]                 INT            NULL,
    [MDSDisableRunBatch]         INT            NULL,
    [RowCountProcessedTotal]     BIGINT         NULL,
    [RowCountProcessedCorrect]   BIGINT         NULL,
    [RowCountProcessedCorrected] BIGINT         NULL,
    [RowCountProcessedNew]       BIGINT         NULL,
    [RowCountProcessedInvalid]   BIGINT         NULL,
    [RowCountFailed]             BIGINT         NULL,
    CONSTRAINT [PK_SSISAudit_MDSDQS] PRIMARY KEY CLUSTERED ([SSISAuditKey] ASC)
);

