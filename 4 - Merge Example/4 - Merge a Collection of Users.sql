
select * from Users
select * from Users_Audit





select * from Users_CompanyX -- SOURCE
select * from users -- TARGET

--Variables Declared
DECLARE @pNow DATETIME2 = GETDATE()
DECLARE @resTable TABLE
			([action] NVARCHAR(20)
			,ID INT
			,FirstName_NEW NVARCHAR(250)
			,FirstName_OLD NVARCHAR(250)
			,LastName_NEW NVARCHAR(250)
			,LastName_OLD NVARCHAR(250)
			,Email_NEW NVARCHAR(350)
			,Email_OLD NVARCHAR(350)
			,Password_NEW NVARCHAR(250)
			,Password_OLD NVARCHAR(250)
			,IsDeleted_NEW BIT
			,IsDeleted_OLD BIT
			,LastUpdated DATETIME2)


	MERGE dbo.Users AS targt
	USING Users_CompanyX AS Sourc
		ON (targt.Email = Sourc.Email)
	WHEN MATCHED
		AND (targt.FirstName			<> Sourc.FirstName
		OR	 targt.LastName				<> Sourc.LastName
		--OR	 targt.PasswordHash			<> Sourc.PasswordHash
		OR	 targt.IsDeleted			<> Sourc.IsDeleted
		)
		THEN UPDATE SET
			targt.FirstName			= Sourc.FirstName
			,targt.LastName			= Sourc.LastName
			--,targt.PasswordHash		= Sourc.PasswordHash
			,targt.IsDeleted		= Sourc.IsDeleted
			,targt.LastUpdatedOn	= @pNow
	WHEN NOT MATCHED BY TARGET
		THEN INSERT
			(FirstName, LastName, Email, PasswordHash, CreatedOn, IsDeleted, LastUpdatedOn)
		VALUES
			(Sourc.FirstName, Sourc.LastName, Sourc.Email, NULL, @pNow, Sourc.IsDeleted, @pNow)
	OUTPUT
		 $action									AS [action]
		,inserted.UserID							AS [ID]
		,inserted.FirstName							AS FirstName_NEW
		,deleted.FirstName							AS FirstName_OLD
		,inserted.LastName							AS LastName_NEW
		,deleted.LastName							AS LastName_OLD
		,inserted.Email								AS Email_NEW
		,deleted.Email								AS Email_OLD
		,inserted.PasswordHash						AS Password_NEW
		,deleted.PasswordHash						AS Password_OLD
		,inserted.IsDeleted							AS IsDeleted_NEW
		,deleted.IsDeleted							AS IsDeleted_OLD
		,@pNow										AS LastUpdated
	INTO @resTable;

	INSERT INTO Users_Audit
		(UserID
		,PasswordHash_Old
		,PasswordHash_New
		,IsDeleted_Old
		,IsDeleted_New
		,UpdatedOn)
	SELECT
		 rt.ID
		,rt.Password_OLD
		,rt.Password_NEW
		,rt.IsDeleted_OLD
		,rt.IsDeleted_NEW
		,rt.LastUpdated
	FROM @resTable rt
