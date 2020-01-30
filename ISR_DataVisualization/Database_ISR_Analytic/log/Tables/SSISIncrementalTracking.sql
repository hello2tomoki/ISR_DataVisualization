CREATE TABLE [log].[SSISIncrementalTracking] (
    [SSISIncrementalTrackingKey] INT       IDENTITY (1, 1) NOT NULL,
    [PackageName]                [sysname] NOT NULL,
    [LastRunTMST]                DATETIME  NOT NULL,
    [LastRunDT]                  DATE      NOT NULL,
    [UpdateBy]                   [sysname] CONSTRAINT [DF_SSISIncrementalLoad_UpdateBy] DEFAULT (suser_sname()) NOT NULL,
    [LastUpdateTMST]             DATETIME  NOT NULL,
    CONSTRAINT [PK_SSISIncementalLoad_SSISIncrmentalTrackingKey] PRIMARY KEY CLUSTERED ([SSISIncrementalTrackingKey] ASC),
    CONSTRAINT [AK_SSISIncrementalLoad_Package] UNIQUE NONCLUSTERED ([PackageName] ASC)
);

