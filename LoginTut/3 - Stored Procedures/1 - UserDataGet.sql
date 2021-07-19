/*******************
Description:
	Get a user from the data base with a return code.
	Return Codes:
		1 = Successful,
		2 = Invalid Password,
		3 = Invalid User. Record does not exist.
		
Examples Procs:
	EXEC UserDataGet @EMail = 'John@Doe.com', @PasswordHash = 'fadfvae5g345g4e5rg'
	EXEC UserDataGet @EMail = 'John@Doe.com', @PasswordHash = 'asdfsadgsd'
	EXEC UserDataGet @EMail = 'Jane@Marry.com', @PasswordHash = 'fadfvae5g345g4e5rg'
*******************/

CREATE PROCEDURE [dbo].[UserDataGet] 
	@EMail NVARCHAR(350),
	@PasswordHash NVARCHAR(250)
AS
BEGIN

	BEGIN TRY

		--Variables
		DECLARE @pReturnCode INT = 0;

		-- Check against Default Record.
		IF EXISTS (SELECT TOP 1 UserID FROM FuzzyFiles.dbo.Users WHERE Email = @EMail AND IsDeleted = 0)
		BEGIN

			--Verify if Password Hash Matches. if it is valid, we're good.
			IF EXISTS(SELECT TOP 1 1 FROM FuzzyFiles.dbo.Users WHERE PasswordHash = @PasswordHash AND Email = @EMail AND IsDeleted = 0)
			BEGIN
				SET @pReturnCode = 1; --Successfully Executed.
			END
			ELSE
			BEGIN
				SET @pReturnCode = 2; --Invalid Password.
			END

		END
		ELSE
		BEGIN
			SET @pReturnCode = 3; --Invalid User. Record does not exist.
		END

		SELECT 
			 x.UserID
			,x.FIrstName
			,x.LastName
			,x.Email
			,x.CreatedOn
			,x.PasswordHash
			,x.IsDeleted
			,@pReturnCode AS 'ReturnCode'
			,u.FirstName
		FROM dbo.Users u
		LEFT JOIN dbo.Users x
			ON x.PasswordHash = @PasswordHash
			AND u.Email = @EMail
			AND x.IsDeleted = 0
		WHERE 1 = 1
			

	END TRY
	BEGIN CATCH

		SELECT 
			ERROR_MESSAGE()		AS ErrorMessage,
			ERROR_LINE()		AS LineNumber
			
	END CATCH

END