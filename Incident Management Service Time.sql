

------------------------------------- Step #1 Initial Triage Analysis -------------------------------------------------------------------------
--- Initial Triage Cycle Time
SELECT
		CAST(____ AS DATE) AS [Date],
		COUNT(*) AS [Number of Events for the Day],
		MIN(CAST(____ AS time)) AS [Time the First Event was Processed],
		MAX(CAST(____ AS time)) AS [Time the Last Event was Processed],
		DATEDIFF(second, MIN(CAST(____ AS time)), MAX(CAST(____ AS time))) AS [Total Time Spent on All Events (seconds)], --includs additional 56 seconds to each event due to an assumption that that is how long it takes per event
		ROUND(CAST(DATEDIFF(second, MIN(CAST(____ AS time)), MAX(CAST(____ AS time))) AS float) / COUNT(*), 2) AS [Time Spend per Event During Morning ____ Meeting (seconds)],
		(DATEDIFF(second, MIN(CAST(____ AS time)), MAX(CAST(____ AS time))) / COUNT(*)) + 56 AS [Time Spent per Event (seconds)], --divids the time spent by the number of events
		ROUND((CAST(DATEDIFF(second, MIN(CAST(____ AS time)), MAX(CAST(____ AS time))) AS float) / COUNT(*)) + 56 , 2) AS [Time Spent per Event (seconds)] --includes pre-processing time 
FROM ____
WHERE (CAST(____ AS TIME) BETWEEN '08:00:00' AND '11:00:00') --makes sure that events that are processed very early or very late do not effect the processing time calulation
GROUP BY CAST(____ AS DATE) 
HAVING	(CAST(____ AS DATE) BETWEEN '2018-03-12' AND '2019-01-31')
		AND (COUNT(*))>10 --used to prevent sidutations where events processed very early in the morning effect the calculation
		AND DATEDIFF(second, MIN(CAST(____ AS time)), MAX(CAST(____ AS time))) > 0 --prevents days when all events where processed at one time from being included into the calulation
ORDER BY CAST(eventupdatedt AS DATE)
--- This ^ output is then used in excel to calculate the average and median time spent per event
--- Output in excel shows intial triage spends about ____ seconds per event
--- file path: H:____


--- Initial Triage Lead Time
SELECT	____,
		____,
		____,
		[Average Lead Time (Hours)]=	(
				SELECT AVG(DATEDIFF(HOUR, CAST(____ AS TIME), CAST(____ AS TIME)))
				FROM ____
				)
FROM ____
WHERE ____ BETWEEN '2018-3-12' AND '2019-3-12'
/* Output shows that there is on average ____ hours lead time between when incidents are available to be worked on(____am) 
and the time inital triages sends it to ____ */




--------------------------------------------- Step #2 ____ Analysis ------------------------------------------------------------------------------
-- How many events were sent to ____ only and not ____
Select * From ____
WHERE ____ = '____' AND ____ BETWEEN '3-12-18' AND '5-1-19'
ORDER BY ____


-- ____ Service Rate
/* To get the service rate take each row and subtract from it the row above it. Ex) service time of 
event id ____: 36,154 seconds - 36,100 seconds = 54 seconds to triage the event. Entire calulation done in excel */
--- excel file path: H:____
--- excel file output shows average of 98 seconds for ____ to triage an event
Select	____,
		____ AS [Action Type], -- Shows that both type of ____ actions are considered (0 or 1)
		____, --shows who triaged the event
		____ AS [Triaged Time Stamp], --Time event was sent to a department workbench
		DATEDIFF(second, 0, CAST(____ AS time)) AS [Time in Seconds] --using seconds because lots of events are processed in under a minute
From ____
WHERE	____ = '____' --not interested in ____ events *____ event timestamps that ____ applys 'no further action' do not effect this analysis and are logged in a different table*
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01') --This date range should exclude the start up period in March for ____
		AND (CAST(____ AS TIME) BETWEEN '09:30:00' AND '12:00:00') --Standard work flow for ____ is suppose to opperate in this time frame each day
		AND (____='____' OR ____='____' OR ____='____' 
		OR ____='____' OR ____='____' OR ____='____') --These users process events without batching, which allows for more accurate processing times calulations
ORDER BY ____


-- % triaged vs % not triaged
-- output shows 
Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/15110*100 AS [Percent Triaged]
From QaEventTriageWorkBench
Where EventTriageEntityCode = 'DQS' AND (EventTriagedToDeptDt BETWEEN '2018-06-1' AND '2019-06-01')
Group By NoFurtherActionRequired

SELECT NoFurtherActionRequired
FROM QaEventTriageWorkBench
WHERE EventTriageEntityCode = 'DQS' AND (EventTriagedToDeptDt BETWEEN '2018-06-1' AND '2019-06-01')



-- % Triaged vs % not triaged By Each T-Pow, *2018-03-12 to 2019-5-1
Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/1544*100 AS [Percent Triaged by 'Carmela']
From QaEventTriageWorkBench
Where	EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
		AND (EventTriagedToDeptBy='cunneenc')
Group By NoFurtherActionRequired

Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/1372*100 AS [Percent Triaged by 'Sarah']
From QaEventTriageWorkBench
Where	EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
		AND (EventTriagedToDeptBy='JonesS2')
Group By NoFurtherActionRequired

Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/1460*100 AS [Percent Triaged by 'Natalie']
From QaEventTriageWorkBench
Where	EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
		AND (EventTriagedToDeptBy='HenryN')
Group By NoFurtherActionRequired

Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/2078*100 AS [Percent Triaged by 'Chris']
From QaEventTriageWorkBench
Where	EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
		AND (EventTriagedToDeptBy='cheaverc')
Group By NoFurtherActionRequired

Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/1631*100 AS [Percent Triaged by 'Jimmy']
From QaEventTriageWorkBench
Where	EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
		AND (EventTriagedToDeptBy='fernandj')
Group By NoFurtherActionRequired

Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/1532*100 AS [Percent Triaged by 'Yana']
From QaEventTriageWorkBench
Where	EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
		AND (EventTriagedToDeptBy='vinogray')
Group By NoFurtherActionRequired

Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/1067*100 AS [Percent Triaged by 'Susan F']
From QaEventTriageWorkBench
Where	EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
		AND (EventTriagedToDeptBy='filshies')
Group By NoFurtherActionRequired

Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/778*100 AS [Percent Triaged by 'Susan C']
From QaEventTriageWorkBench
Where	EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
		AND (EventTriagedToDeptBy='Concanns')
Group By NoFurtherActionRequired

Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/949*100 AS [Percent Triaged by 'Cathy']
From QaEventTriageWorkBench
Where	EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
		AND (EventTriagedToDeptBy='vadaszc')
Group By NoFurtherActionRequired

Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/1156*100 AS [Percent Triaged by 'Robin']
From QaEventTriageWorkBench
Where	EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
		AND (EventTriagedToDeptBy='moulderr')
Group By NoFurtherActionRequired

Select 
		NoFurtherActionRequired,
		COUNT(NoFurtherActionRequired) AS [# of Events],
		CAST(COUNT(NoFurtherActionRequired) AS decimal(10,2))/1500*100 AS [Percent Triaged by 'Diane']
From QaEventTriageWorkBench
Where EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
		AND (EventTriagedToDeptBy='llerandd')
Group By NoFurtherActionRequired




--- % of Events Triaged to Each Department Including Regional Events
/* Results are graphed in excel and also grouped by person in excel too */
Select 
		EventTriageActionEntity,
		COUNT(EventTriageActionEntity) AS [# of Events Triaged to Dept Workbenchs],
		CAST(COUNT(EventTriageActionEntity)/4453.00*100 AS NUMERIC(6,2)) AS [% of Total Events]
FROM QaEventTriageAction
WHERE	(EventTriageActionCode = '103')
		AND (EventTriageActionEntity != 'NQS')
		AND (EventTriageActionEnterDt BETWEEN '2018-03-12' AND '2019-05-01')
GROUP BY EventTriageActionEntity
ORDER BY COUNT(EventTriageActionEntity) DESC


--- % of Events Triaged to Each Department Excludig Regional Events
/* Results are graphed in excel and also grouped by person in excel too */
Select	EventTriageActionEntity,
		COUNT(EventTriageActionEntity) AS [# of Events Triaged to Dept Workbenchs],
		CAST(COUNT(EventTriageActionEntity)/3363.00*100 AS NUMERIC(6,2)) AS [% of Total Events]
FROM QaEventTriageAction A
LEFT JOIN QaEventInfo B 
ON A.EventId = B.EventId
WHERE (A.EventTriageActionEnterDt BETWEEN '2018-04-13' AND '2019-05-01')
	AND (A.EventTriageActionCode = '103')
	AND (A.EventTriageActionEntity != 'NQS')
	AND (B.IsRegional IS NULL)
GROUP BY EventTriageActionEntity
ORDER BY COUNT(EventTriageActionEntity) DESC


-- Cathy Request for Raw Data of Above Query
Select A.EventId, B.RISQFileId, EventTriageEnterDt, EventTriagedToDeptBy, CASE WHEN NoFurtherActionRequired = 1 THEN 'NFA' ELSE 'Triaged' end
From QaEventTriageWorkBench A LEFT JOIN QaEventInfo B ON A.EventId = B.EventId 
Where	EventTriageEntityCode = 'DQS' 
		AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')

Select A.EventId, B.RISQFileId, EventTriageEnterDt, EventTriagedToDeptBy, act.EventTriageActionEntity 'TriagedByTPOW',
CASE WHEN NoFurtherActionRequired = 1 THEN 'NFA' ELSE 'Triaged' end as 'Triaged?', a.eventtriagecomment 'Agnes Comment'
From QaEventTriageWorkBench A LEFT JOIN QaEventInfo B ON A.EventId = B.EventId
left join QaEventTriageAction act on a.eventtriageid = act.EventTriageId and act.EventTriageActionCode = '103'
Where  EventTriageEntityCode = 'DQS' 
            AND (EventTriagedToDeptDt BETWEEN '2018-03-12' AND '2019-05-01')
                     and a.EventTriagedToDeptBy <> 'PatelD3'
                     order by RISQFileId


--- % of Events Sent for QA Review
--For the above ^ Refer to Ishita's Tableau Dashboard


------------------------------------------------- Department Workbench Analysis ------------------------------------------------------------

--- Days in Workbench
SELECT	EventID,
		EventTriageActionCode,
		EventTriageActionEnterDt,
		DATEDIFF(DAY, '2018-01-01', EventTriageActionEnterDt) AS [Date/Time Converted into Days], ---using '2018-01-01' as the start date for the calculation so that i have a constant measurement point, excel has trouble substracting cells with date and time in one cell
		DATEDIFF(HOUR, '2018-01-01', EventTriageActionEnterDt) AS [Date/Time Converted into Hours]
FROM QaEventTriageAction
WHERE EventTriageActionCode IN ('103', '107')
ORDER BY EventId, EventTriageActionEnterDt


--- DQS repersentative Workload Distribution (including regional events)
--- results are displayed as a graph using excel
/* psychiatry workbench has had many owners over this time peroid so a fixed number of 145 events is added to the excel 
file representing the past owners on psychiatry workbench. 145 is also added to the total count below in the mathmatical
equation section of the code. */
/* SELECT	EventTriageActionEnterBy AS [DQS Representative],
		COUNT(EventTriageActionEnterBy) AS [# of Events Processed],
		CAST(COUNT(EventTriageActionEnterBy)/3104.00*100 AS NUMERIC(6,2)) AS [% of Total Events]
FROM QaEventTriageAction
WHERE	(EventTriageActionEnterBy = 'llerandd' OR EventTriageActionEnterBy = 'CunneenC' OR 
		EventTriageActionEnterBy = 'JonesS2' OR	EventTriageActionEnterBy = 'cheaverc' 
		OR EventTriageActionEnterBy = 'fernandj' OR EventTriageActionEnterBy = 'vinogray' 
		OR EventTriageActionEnterBy = 'moulderr')
		AND	(EventTriageActionEnterDt BETWEEN '2018-04-13' AND '2019-05-01')
		AND (EventTriageActionCode = '107')
GROUP BY EventTriageActionEnterBy
ORDER BY COUNT(EventTriageActionEnterBy) DESC



--- DQS repersentative Workload Distribution (excluding regional events)
--- results are displayed as a graph using excel
/* psychiatry workbench has had many owners over this time peroid so a fixed number of 145 events is added to the excel 
file representing the past owners on psychiatry workbench. 145 is also added to the total count below in the mathmatical
equation section of the code. */
SELECT	EventTriageActionEnterBy AS [DQS Representative],
		COUNT(EventTriageActionEnterBy) AS [# of Events Processed],
		CAST(COUNT(EventTriageActionEnterBy)/2933.00*100 AS NUMERIC(6,2)) AS [% of Total Events]
FROM QaEventTriageAction A LEFT JOIN QaEventInfo B 
ON A.EventId = B.EventId
WHERE	(EventTriageActionEnterBy = 'llerandd' OR EventTriageActionEnterBy = 'CunneenC' OR 
		EventTriageActionEnterBy = 'JonesS2' OR	EventTriageActionEnterBy = 'cheaverc' 
		OR EventTriageActionEnterBy = 'fernandj' OR EventTriageActionEnterBy = 'vinogray' 
		OR EventTriageActionEnterBy = 'moulderr')
		AND	(A.EventTriageActionEnterDt BETWEEN '2018-04-13' AND '2019-05-01')
		AND (A.EventTriageActionCode = '107')
		AND (B.IsRegional IS NULL)
GROUP BY EventTriageActionEnterBy
ORDER BY COUNT(EventTriageActionEnterBy) DESC

--- Shows the 145 Psychiatry events
SELECT	EventTriageActionEntity
FROM QaEventTriageAction
WHERE EventTriageActionEntity = 'Case Management QA'
AND (EventTriageActionEnterDt BETWEEN '2018-04-13' AND '2019-05-01')


SELECT	DISTINCT(EventTriageActionEntity)
FROM QaEventTriageAction */

------------------------------------------------- Sign Workbench Analysis ------------------------------------------------------------------
SELECT * 
FROM QaEventTriageAction
ORDER BY Eventtriageid

--- Sign off Lead Time
SELECT	EventTriageid,
		EventTriageActionCode,
		EventTriageActionEntity AS [Triaged To],
		EventTriageActionEnterDt AS [Date/Time of Triage],
		DATEDIFF(Day, '2018-01-01', EventTriageActionEnterDt) AS [Date/Time Converted into Days], ---using '2018-01-01' as the start start of the time calculation so that i have a constant measurement point, excel is then used to calculate the difference between rows
		DATEDIFF(HOUR, '2018-01-01', EventTriageActionEnterDt) AS [Date/Time Converted into Hours],
		DATEDIFF(MINUTE, '2018-01-01', EventTriageActionEnterDt) AS [Date/Time Converted into Minutes]
FROM QaEventTriageAction
WHERE	EventTriageActionCode = '107' OR EventTriageActionCode = '108'	--- shows the first time stamp as time entered workbench and the second time stamp as 
ORDER BY EventTriageId, EventTriageActionEnterDt
--- this ^ output is then used in excel to calculate the time eplapsed between the 107(send to signoff) and 108(signed off) codes


--- Sign off Workbench Cycle Time
SELECT	EventTriageActionId,
		EventTriageActionCode,
		EventTriageActionEntity,
		EventTriageActionEnterDt
FROM QaEventTriageAction
WHERE EventTriageActionCode = '108' AND EventTriageActionEnterDt BETWEEN '2018-3-12' AND '2019-3-12'
--- this ^ output is then used in excel to calculate the time between each signoff(108) code


--- Number of Events Failing Sign Off
SELECT	EventTriageid,
		EventTriageActionCode,
		EventTriageActionEnterBy,
		EventTriageActionEnterDt
FROM QaEventTriageAction
WHERE	EventTriageActionCode = '109'	
ORDER BY EventTriageActionEnterDt


--- Volume of Signed off Events per Month
SELECT	CONVERT(CHAR(2), EventTriageActionEnterDt, 101) + '-' + CONVERT(CHAR(4), EventTriageActionEnterDt, 120) AS [Month],
		COUNT(CONVERT(CHAR(2), EventTriageActionEnterDt, 101) + '-' + CONVERT(CHAR(4), EventTriageActionEnterDt, 120)) AS [# of events signed off per month]
FROM QaEventTriageAction
WHERE EventTriageActionCode = '108'
GROUP BY CONVERT(CHAR(2), EventTriageActionEnterDt, 101) + '-' + CONVERT(CHAR(4), EventTriageActionEnterDt, 120)
ORDER BY CONVERT(CHAR(2), EventTriageActionEnterDt, 101) + '-' + CONVERT(CHAR(4), EventTriageActionEnterDt, 120)


--- Volume of Signed off Events per Day
SELECT	CAST(EventTriageActionEnterDt AS Date) AS [Date],
		COUNT(CAST(EventTriageActionEnterDt AS Date)) AS [# of signed of events]
FROM QaEventTriageAction
WHERE EventTriageActionCode = '108' AND EventTriageActionEnterDt BETWEEN '2018-3-12' AND '2019-3-12'
GROUP BY CAST(EventTriageActionEnterDt AS Date)
ORDER BY CAST(EventTriageActionEnterDt AS Date)




























