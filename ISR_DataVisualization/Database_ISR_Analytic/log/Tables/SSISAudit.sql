CREATE TABLE [log].[SSISAudit] (
    [BatchID]                  INT            DEFAULT ((-1)) NULL,
    [SSISAuditKey]             INT            IDENTITY (1, 1) NOT NULL,
    [PackageName]              [sysname]      NOT NULL,
    [RunBy]                    [sysname]      DEFAULT (suser_sname()) NOT NULL,
    [LineageTMST]              DATETIME       DEFAULT (getdate()) NOT NULL,
    [CompleteTMST]             DATETIME       NULL,
    [DurationSecond]           AS             (case when datepart(year,[LineageTMST])>(1753) AND datepart(year,[CompleteTMST])>(1753) then datediff(second,[LineageTMST],[CompleteTMST])  end),
    [CompletionMessage]        VARCHAR (512)  NULL,
    [ExecutionInstanceGUID]    NVARCHAR (100) NULL,
    [RowCountBefore]           BIGINT         NULL,
    [RowCountProcessedTotal]   BIGINT         NULL,
    [RowCountProcessedNew]     BIGINT         NULL,
    [RowCountProcessedUpdated] BIGINT         NULL,
    [RowCountProcessedIgnored] BIGINT         NULL,
    [RowCountFailed]           BIGINT         NULL,
    [RowCountAfter]            BIGINT         NULL,
    [RowCountDelta]            AS             (case [RowCountAfter] when NULL then NULL else [RowCountAfter]-[RowCountBefore] end),
    [TableMaxSurrogateKey]     BIGINT         NULL,
    CONSTRAINT [PK_SSISAudit] PRIMARY KEY CLUSTERED ([SSISAuditKey] ASC)
);

