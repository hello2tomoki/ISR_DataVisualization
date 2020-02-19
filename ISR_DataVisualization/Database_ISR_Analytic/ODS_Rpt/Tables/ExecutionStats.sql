CREATE TABLE [catalog1].[ExecutionStats] (
    [ExecutionID]           VARCHAR (250)   NULL,
    [ExecutableID]          VARCHAR (250)   NULL,
    [PackageStep]           VARCHAR (250)   NULL,
    [StepStartMS]           INT             NULL,
    [StepStart]             INT             NULL,
    [StepEnd]               INT             NULL,
    [StepDurationMS]        VARCHAR (250)   NULL,
    [ExecutionResultCode]   VARCHAR (250)   NULL,
    [Steps]                 VARCHAR (250)   NULL,
    [TargetErrors]          VARCHAR (250)   NULL,
    [StepDurationInMinutes] DECIMAL (10, 4) NULL,
    [StepStartDate]         DATE            NULL,
    [StepStartDayNo]        VARCHAR (250)   NULL,
    [StepStartHour]         VARCHAR (250)   NULL,
    [StepOrderStart]        INT             NULL,
    [StepOrderStart5]       INT             NULL,
    [StepOrderEnd]          INT             NULL,
    [StepOrderEnd5]         INT             NULL,
    [StartOrderRev]         INT             NULL,
    [FailedSteps]           VARCHAR (250)   NULL,
    [ExecutionResult]       VARCHAR (250)   NULL
);

