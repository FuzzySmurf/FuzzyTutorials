/*
EXEC dbo.[UserDataMergeInsert] @FirstName = 'Tyrionne', @LastName = 'Lannister', @Email = 'RemakeSeason7@GoT.com', @passwordHash = NULL
select * from Users
*/

CREATE OR ALTER PROCEDURE [dbo].[UserDataMergeInsert]
	@FirstName NVARCHAR(250),
	@LastName NVARCHAR(250),
	@Email NVARCHAR(350),
	@PasswordHash NVARCHAR(250),
	@IsDeleted BIT = 0
AS

BEGIN

	BEGIN TRY

	--Variables
	DECLARE @pNow DATETIME2 = GETDATE()
	DECLARE @pUserID INT = (SELECT TOP 1 UserID FROM Users WHERE Email = @Email);

	DECLARE @resTable TABLE
			([action] NVARCHAR(20)
			,ID INT
			,[TableType] NVARCHAR(50)
			,[type] NVARCHAR(250))

	--select * from Users

	MERGE dbo.Users AS targt
	USING (SELECT	 @FirstName			AS FirstName
					,@LastName			AS LastName
					,@Email				AS EMail
					,@PasswordHash		AS PasswordHash
					,@pUserID			AS UserID
					,@IsDeleted			AS IsDeleted
			)	AS Sourc
		ON (targt.UserID = Sourc.UserID)
	WHEN MATCHED
		AND (targt.FirstName		<>	Sourc.FirstName
		OR	 targt.LastName			<>	Sourc.LastName
		OR	 targt.PasswordHash		<>	Sourc.PasswordHash
		OR	 targt.IsDeleted		<>	Sourc.IsDeleted
		)
		THEN UPDATE SET	
			 TARGT.FirstName		= Sourc.FirstName
			,TARGT.LastName			= Sourc.LastName
			,TARGT.PasswordHash		= Sourc.PasswordHash
			,TARGT.IsDeleted		= Sourc.IsDeleted
			,TARGT.LastUpdatedOn	= @pNow
	WHEN NOT MATCHED BY TARGET
		THEN INSERT
			(FirstName, LastName, Email, PasswordHash, CreatedOn, IsDeleted, LastUpdatedOn)
		VALUES
			(Sourc.FirstName, Sourc.LastName, Sourc.Email, Sourc.PasswordHash, @pNow, 0, @pNow)
	OUTPUT
		 $action									AS [action]
		,inserted.UserID							AS [ID]
		,'Users Table'								AS [TableType]
		,ISNULL(inserted.UserID, deleted.UserID)	AS [Type]
	INTO @resTable;

	SELECT * FROM @resTable;

	END TRY
	BEGIN CATCH
		
		SELECT
			@@ERROR as err,
			ERROR_MESSAGE()		as errorMessage,
			ERROR_LINE()		as LineNumber,
			ERROR_STATE()		as errorState

	END CATCH

END