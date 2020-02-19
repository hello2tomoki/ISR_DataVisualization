
CREATE   PROCEDURE [catalog1].[SystemTableAccessSSISDb] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;

TRUNCATE TABLE catalog1.ExecutionStats
TRUNCATE TABLE catalog1.JobFailures
TRUNCATE TABLE catalog1.RunningSQLJobs
TRUNCATE TABLE catalog1.JobsHistory

DROP TABLE IF EXISTS #a
SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

DECLARE @startexecutionid INT
SELECT @startexecutionid = MIN(execution_id)
FROM    ssisdb.[catalog].[executions] ex
WHERE ex.[start_time] > DATEADD(DAY, -1* 7, CONVERT(DATE, GETDATE()));

DECLARE @statistics_id INT
SELECT @statistics_id = MIN(statistics_id)
FROM       ssisdb.[internal].[executable_statistics]
WHERE execution_id >= @startexecutionid

SELECT  es.execution_id AS ExecutionID ,
        es.executable_id AS ExecutableID ,
        es.execution_path AS PackageStep ,
        DateDiff(MS, CONVERT(date, es.start_time) ,CONVERT(DATETIME2(3), es.start_time)) AS StepStartMS ,
        DateDiff(SECOND, CONVERT(date, es.start_time) ,CONVERT(DATETIME2(3), es.start_time)) AS StepStart ,
		DateDiff(SECOND, CONVERT(date, es.start_time) , CONVERT(DATETIME2(3), es.end_time)) AS StepEnd ,
        [execution_duration] StepDurationMS ,
        [execution_result] ExecutionResultCode,
		CONVERT(TINYINT,1) as Steps,
		CONVERT(TINYINT,0) as TargetErrors,
		CONVERT(DECIMAL(10,4), [execution_duration] / 1000.0 / 60.0) as StepDurationInMinutes,
		Convert(date, es.start_time) as StepStartDate,
		DatePart(DW, es.start_time) as StepStartDayNo,
		DatePart(hh, es.start_time) as StepStartHour,
		Convert(integer,DatePart(HOUR, es.start_time))+
			Convert(Integer,DatePart(MINUTE, es.start_time)/15)*0.25 as StepOrderStart,
		Convert(integer,DatePart(HOUR, es.start_time))+
		(
		(
		Convert(Integer,DatePart(MINUTE, es.start_time))/5
		)*5
		)*1/60.0 as StepOrderStart5,
		Convert(integer,DatePart(HOUR, es.end_time))+
				Convert(Integer,DatePart(MINUTE, es.end_time)/15)*0.25 as StepOrderEnd,
		Convert(integer,DatePart(HOUR, es.end_time))+
		(
		(
		Convert(Integer,DatePart(MINUTE, es.end_time))/5
		)*5
		)*1/60.0 as StepOrderEnd5,
		-(Convert(integer,DatePart(HOUR, es.start_time))+
			Convert(Integer,DatePart(MINUTE, es.start_time)/15)*0.25) StartOrderRev,
			--REVERSE(left(REVERSE(es.execution_path), charindex('\',REVERSE(es.execution_path))-1)) as StepLeaf,
						CONVERT(TINYINT, CASE WHEN [execution_result] = 1 THEN 1 ELSE 0 END) as FailedSteps,
			CASE [execution_result] 
			WHEN 1 THEN 'Failure'
			WHEN 2 THEN 'Completion'
			WHEN 3 THEN 'Cancelled'
			ELSE 'Sucess' END as ExecutionResult

INTO #a
FROM    ssisdb.[catalog].[executable_statistics] es
WHERE [statistics_id] >= @statistics_id;

INSERT INTO catalog1.ExecutionStats(
        ExecutionID ,
        ExecutableID ,
        PackageStep ,
        StepStartMS ,
        StepStart ,
		StepEnd ,
        StepDurationMS ,
        ExecutionResultCode ,
		Steps ,
		TargetErrors ,
		StepDurationInMinutes ,
		StepStartDate ,
		StepStartDayNo ,
		StepStartHour ,
        StepOrderStart ,
        StepOrderStart5 ,
        StepOrderEnd ,
        StepOrderEnd5 ,
        StartOrderRev ,
		FailedSteps ,
        ExecutionResult 
)

SELECT  ExecutionID ,
        ExecutableID ,
        PackageStep ,
        StepStartMS ,
        StepStart ,
		StepEnd ,
        StepDurationMS ,
        ExecutionResultCode ,
		Steps ,
		TargetErrors ,
		StepDurationInMinutes ,
		StepStartDate ,
		StepStartDayNo ,
		StepStartHour ,
        StepOrderStart ,
        StepOrderStart5 ,
        StepOrderEnd ,
        StepOrderEnd5 ,
        StartOrderRev ,
		FailedSteps ,
        ExecutionResult 
FROM #a

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
WITH b AS
(
SELECT sj.name as JobName, 
sja.start_execution_date StartExecutionDate,
sja.run_requested_date RuNRequestedDate

--INTO #b
FROM msdb.dbo.sysjobs sj
JOIN msdb.dbo.sysjobactivity sja
ON sj.job_id = sja.job_id
WHERE 1=1
AND session_id = (
    SELECT MAX(session_id) FROM msdb.dbo.sysjobactivity WHERE    sj.job_id = sja.job_id )
AND sja.start_execution_date IS NOT NULL AND sja.stop_execution_date IS NULL
)

INSERT INTO catalog1.RunningSQLJobs(
JobName , 
StartExecutionDate ,
RuNRequestedDate 
)

SELECT JobName , 
StartExecutionDate ,
RuNRequestedDate 
FROM b

DROP TABLE IF EXISTS #c
SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;


SELECT h.server as Server,
	j.name as Name,
	h.message as Message,
	h.run_date as LastRunDate, 
	h.run_time as LastRunTime

INTO #c
FROM msdb.dbo.sysjobhistory h
	inner join msdb.dbo.sysjobs j on h.job_id = j.job_id
		where j.enabled = 1 
		and h.instance_id in
		(select max(h.instance_id)
			from sysjobhistory h group by (h.job_id))
		and h.run_status = 0

INSERT INTO catalog1.JobFailures
(Server ,
	Name ,
	Message ,
	LastRunDate , 
	LastRunTime)

SELECT Server ,
	Name ,
	Message ,
	LastRunDate , 
	LastRunTime
	FROM #c

DROP TABLE IF EXISTS #d
SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT sj.name AS [Job Name],
 convert(date, convert(varchar,run_date), 112 ) as 'Run Date', 
-- msdb.dbo.agent_datetime(run_date, run_time) as 'Run Date Time'        , 
 CONVERT(VARCHAR,DATEADD(S,(run_time/10000)*60*60 /* hours */  
          +((run_time - (run_time/10000) * 10000)/100) * 60 /* mins */  
          + (run_time - (run_time/100) * 100)  /* secs */ 
           ,CONVERT(DATETIME,RTRIM(run_date),112)),100) AS [Time Run]
         ,CASE WHEN sjh.run_status=0 THEN 'Failed'
                     WHEN sjh.run_status=1 THEN 'Succeeded'
                     WHEN sjh.run_status=2 THEN 'Retry'
                     WHEN sjh.run_status=3 THEN 'Cancelled'
               ELSE 'Unknown'  
          END [Job Outcome],
CASE WHEN sjh.run_status=0 THEN 'Red'
                     WHEN sjh.run_status=1 THEN 'LightGreen'
                     WHEN sjh.run_status=2 THEN 'Orange'
                     WHEN sjh.run_status=3 THEN 'Blue'
               ELSE 'Yellow'  
          END [Job Outcome Colour],
           sc.[name] as Category, [category_type] as [Category Type], 
		  [step_id]  as Step,[step_name] as [Step Name],[message] as Message
,run_duration/10000*60 + run_duration/100%100 + run_duration%100/60.0 as Duration

INTO #d
FROM   msdb.dbo.sysjobhistory sjh  
JOIN   msdb.dbo.sysjobs sj  
ON     SJH.job_id=sj.job_id  
		INNER JOIN [syscategories] sc on sc.[category_id]=sj.[category_id]
WHERE  step_id=0  
AND CONVERT(DATETIME,RTRIM(run_date),112) >= DATEADD(d,-8,Convert(Date,GetDate()))

INSERT INTO catalog1.JobsHistory
(
Job_Name ,
 Run_Date , 
hours
,Time_Run 
,Job_Outcome ,
Job_Outcome_Colour ,
Category ,
Category_Type ,
Message 
,Duration
)

SELECT Job_Name ,
 Run_Date , 
-- msdb.dbo.agent_datetime(run_date, run_time) as 'Run Date Time'        , 
hours
,Time_Run 
,Job_Outcome ,
Job_Outcome_Colour ,
Category ,
Category_Type ,
Message 
,Duration
FROM #d

END