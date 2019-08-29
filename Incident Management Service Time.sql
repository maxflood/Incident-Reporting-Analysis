

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
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/15110*100 AS [Percent Triaged]
From ____
Where ____ = '____' AND (____ BETWEEN '2018-06-1' AND '2019-06-01')
Group By ____

SELECT ____
FROM ____
WHERE ____ = '____' AND (____ BETWEEN '2018-06-1' AND '2019-06-01')



-- % Triaged vs % not triaged By Each ____, *2018-03-12 to 2019-5-1
Select 
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/1544*100 AS [Percent Triaged by '____']
From ____
Where	____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
		AND (____='____')
Group By ____

Select 
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/1372*100 AS [Percent Triaged by '____']
From ____
Where	____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
		AND (____='____')
Group By ____

Select 
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/1460*100 AS [Percent Triaged by '____']
From ____
Where	____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
		AND (____='____')
Group By ____

Select 
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/2078*100 AS [Percent Triaged by '____']
From ____
Where	____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
		AND (____='____')
Group By ____

Select 
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/1631*100 AS [Percent Triaged by '____']
From ____
Where	____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
		AND (____='____')
Group By ____

Select 
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/1532*100 AS [Percent Triaged by '____']
From ____
Where	____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
		AND (____='____')
Group By ____

Select 
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/1067*100 AS [Percent Triaged by '____']
From ____
Where	____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
		AND (____='____')
Group By ____

Select 
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/778*100 AS [Percent Triaged by '____']
From ____
Where	____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
		AND (____='____')
Group By ____

Select 
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/949*100 AS [Percent Triaged by '____']
From ____
Where	____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
		AND (____='____')
Group By ____

Select 
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/1156*100 AS [Percent Triaged by '____']
From ____
Where	____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
		AND (____='____')
Group By ____

Select 
		____,
		COUNT(____) AS [# of Events],
		CAST(COUNT(____) AS decimal(10,2))/1500*100 AS [Percent Triaged by '____']
From ____
Where ____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
		AND (____='____')
Group By ____




--- % of Events Triaged to Each Department Including Regional Events
/* Results are graphed in excel and also grouped by person in excel */
Select 
		____,
		COUNT(____) AS [# of Events Triaged to Dept Workbenchs],
		CAST(COUNT(____)/4453.00*100 AS NUMERIC(6,2)) AS [% of Total Events]
FROM ____
WHERE	(____ = '103')
		AND (____ != '____')
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
GROUP BY ____
ORDER BY COUNT(____) DESC


--- % of Events Triaged to Each Department Excludig Regional Events
/* Results are graphed in excel and also grouped by person in excel too */
Select	____,
		COUNT(____) AS [# of Events Triaged to Dept Workbenchs],
		CAST(COUNT(____)/3363.00*100 AS NUMERIC(6,2)) AS [% of Total Events]
FROM ____ A
LEFT JOIN ____ B 
ON A.____ = B.____
WHERE (A.____ BETWEEN '2018-04-13' AND '2019-05-01')
	AND (A.____ = '103')
	AND (A.____ != '____')
	AND (B.____ IS NULL)
GROUP BY ____
ORDER BY COUNT(____) DESC


-- ____ Request for Raw Data of Above Query
Select A.____, B.____, ____, ____, CASE WHEN ____ = 1 THEN 'NFA' ELSE 'Triaged' end
From ____ A LEFT JOIN ____ B ON A.____ = B.____ 
Where	____ = '____' 
		AND (____ BETWEEN '2018-03-12' AND '2019-05-01')

Select A.____, B.____, ____, ____, act.____ '____',
CASE WHEN ____ = 1 THEN 'NFA' ELSE 'Triaged' end as 'Triaged?', a.____ '____'
From ____ A LEFT JOIN ____ B ON A.____ = B.____
left join ____ act on a.____ = act.____ and act.____ = '103'
Where  ____ = '____' 
            AND (____ BETWEEN '2018-03-12' AND '2019-05-01')
                     and a.____ <> '____'
                     order by ____


--- % of Events Sent for QA Review
--For the above ^ Refer to ____ Tableau Dashboard


------------------------------------------------- Step #3 Department Workbench Analysis ------------------------------------------------------------

--- Days in Workbench
SELECT	____,
		____,
		____,
		DATEDIFF(DAY, '2018-01-01', ____) AS [Date/Time Converted into Days], ---using '2018-01-01' as the start date for the calculation so that i have a constant measurement point, excel has trouble substracting cells with date and time in one cell
		DATEDIFF(HOUR, '2018-01-01', ____) AS [Date/Time Converted into Hours]
FROM ____
WHERE ____ IN ('103', '107')
ORDER BY ____, ____


--- ____ repersentative Workload Distribution (including regional events)
--- results are displayed as a graph using excel
/* psychiatry workbench has had many owners over this time peroid so a fixed number of ____ events is added to the excel 
file representing the past owners on psychiatry workbench. ____ is also added to the total count below in the mathmatical
equation section of the code. */
/* SELECT	____ AS [____ Representative],
		COUNT(____) AS [# of Events Processed],
		CAST(COUNT(____)/3104.00*100 AS NUMERIC(6,2)) AS [% of Total Events]
FROM ____
WHERE	(____ = '____' OR ____ = '____' OR 
		____ = '____' OR	____ = '____' 
		OR ____ = '____' OR ____ = '____' 
		OR ____ = '____')
		AND	(____ BETWEEN '2018-04-13' AND '2019-05-01')
		AND (____ = '107')
GROUP BY ____
ORDER BY COUNT(____) DESC



--- ____ repersentative Workload Distribution (excluding regional events)
--- results are displayed as a graph using excel
/* psychiatry workbench has had many owners over this time peroid so a fixed number of ____ events is added to the excel 
file representing the past owners on psychiatry workbench. ____ is also added to the total count below in the mathmatical
equation section of the code. */
SELECT	____ AS [____ Representative],
		COUNT(____) AS [# of Events Processed],
		CAST(COUNT(____)/2933.00*100 AS NUMERIC(6,2)) AS [% of Total Events]
FROM ____ A LEFT JOIN ____ B 
ON A.____ = B.____
WHERE	(____ = '____' OR ____ = '____' OR 
		____ = '____' OR	____ = '____' 
		OR ____ = '____' OR ____ = '____' 
		OR ____ = '____')
		AND	(A.____ BETWEEN '2018-04-13' AND '2019-05-01')
		AND (A.____ = '107')
		AND (B.____ IS NULL)
GROUP BY ____
ORDER BY COUNT(____) DESC

--- Shows the ____ Psychiatry events
SELECT	____
FROM ____
WHERE ____ = 'Case Management QA'
AND (____ BETWEEN '2018-04-13' AND '2019-05-01')


SELECT	DISTINCT(____)
FROM ____ */

-------------------------------------------------Step #4 Sign off Workbench Analysis ------------------------------------------------------------------
SELECT * 
FROM ____
ORDER BY ____

--- Sign off Lead Time
SELECT	____,
		____,
		____ AS [Triaged To],
		____ AS [Date/Time of Triage],
		DATEDIFF(Day, '2018-01-01', ____) AS [Date/Time Converted into Days], ---using '2018-01-01' as the start start of the time calculation so that i have a constant measurement point, excel is then used to calculate the difference between rows
		DATEDIFF(HOUR, '2018-01-01', ____) AS [Date/Time Converted into Hours],
		DATEDIFF(MINUTE, '2018-01-01', ____) AS [Date/Time Converted into Minutes]
FROM ____
WHERE	____ = '107' OR ____ = '108'	--- shows the first time stamp as time entered workbench and the second time stamp as 
ORDER BY ____, ____
--- this ^ output is then used in excel to calculate the time eplapsed between the 107(send to signoff) and 108(signed off) codes


--- Sign off Workbench Cycle Time
SELECT	____,
		____,
		____,
		____
FROM ____
WHERE ____ = '108' AND ____ BETWEEN '2018-3-12' AND '2019-3-12'
--- this ^ output is then used in excel to calculate the time between each signoff(____) code


--- Number of Events Failing Sign Off
SELECT	____,
		____,
		____,
		____
FROM ____
WHERE	____ = '109'	
ORDER BY ____


--- Volume of Signed off Events per Month
SELECT	CONVERT(CHAR(2), ____, 101) + '-' + CONVERT(CHAR(4), ____, 120) AS [Month],
		COUNT(CONVERT(CHAR(2), ____, 101) + '-' + CONVERT(CHAR(4), ____, 120)) AS [# of events signed off per month]
FROM ____
WHERE ____ = '108'
GROUP BY CONVERT(CHAR(2), ____, 101) + '-' + CONVERT(CHAR(4), ____, 120)
ORDER BY CONVERT(CHAR(2), ____, 101) + '-' + CONVERT(CHAR(4), ____, 120)


--- Volume of Signed off Events per Day
SELECT	CAST(____ AS Date) AS [Date],
		COUNT(CAST(____ AS Date)) AS [# of signed of events]
FROM ____
WHERE ____ = '108' AND ____ BETWEEN '2018-3-12' AND '2019-3-12'
GROUP BY CAST(____ AS Date)
ORDER BY CAST(____ AS Date)




























