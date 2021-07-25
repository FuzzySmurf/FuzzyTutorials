Sections Below:
	1 - First section is for people who are continuing from the 'Login Structural Design' Tutorial.
	2 - Second section is for people who are continuing from scratch.
	3 - Helpful References to SQL Plan Cache.

/*--------------------------------------------------------------------
SECTION 1 - Login Structural Design Continuation
--------------------------------------------------------------------*/

This continues from my 'Login Structural Design' Tutorial:
* https://www.youtube.com/watch?v=N4crxjIRxis

If you are continuing from The first Tutorial, go to:
 SQL UpdateAndUpSert - LoginTut / 2 - CreateOrAlter Table / Alter Users Table.sql
 SQL UpdateAndUpSert - LoginTut / 3 - UpdateAndUpSert / 1-UserDataUpdate.sql
 SQL UpdateAndUpSert - LoginTut / 3 - UpdateAndUpSert / 2-UserDataUpSert.sql
 
 
/*--------------------------------------------------------------------
SECTION 2 - From Scratch / Quick Installation
--------------------------------------------------------------------*/
1. If you don't already, I recommend making a database for yourself, and implement all the scripts you run,
	under the given database. otherwise, the given scripts may default under Folder: System Databases/Master
	
2. Run the '2 - CreateOrAlter Table' Folder in numerical order in your given database.
* SQL UpdateAndUpSert - LoginTut / 2 - CreateOrAlter Table / Alter Users Table.sql

3. Run the '3 - UpdateAndUpSert' Folder in numerical order in your given database.
SQL UpdateAndUpSert - LoginTut / 3 - UpdateAndUpSert / 1-UserDataUpdate.sql
 SQL UpdateAndUpSert - LoginTut / 3 - UpdateAndUpSert / 2-UserDataUpSert.sql


/*--------------------------------------------------------------------
SECTION 3 - SQL Plan Cache
--------------------------------------------------------------------*/
In a nutshell, SQL Plan Cache contains the recently cached executions on SQL. its relatively helpful for anything that is currently running
and getting an execution plan for each sql statement ran against SQL. Gives a count of SQL statements ran against it as well.


Helpful Links:
* https://www.sqlshack.com/understanding-sql-server-query-plan-cache/
* https://www.mssqltips.com/sqlservertip/1661/analyzing-the-sql-server-plan-cache/

--sql server Plan Cache View

SELECT UseCounts,RefCounts, Cacheobjtype, Objtype, 
ISNULL(DB_NAME(dbid),'ResourceDB') AS DatabaseName, TEXT AS SQL 
FROM sys.dm_exec_cached_plans 
CROSS APPLY sys.dm_exec_sql_text(plan_handle) 
ORDER BY dbid,usecounts DESC;