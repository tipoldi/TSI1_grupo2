USE master
IF (
	EXISTS (
		SELECT name 
		FROM master.dbo.sysdatabases 
		WHERE (name = '$(dbname)')
	)
) BEGIN
	DROP Database [$(dbname)]
	PRINT 'Database was deleted.'
END