/*******************
Description:
	Used to Upsert a Users Data.
		
Examples Procs:
	SELECT * FROM Users
	EXEC UserDataUpdate @UserID = 1, @EMail = 'John@Doe.com', @FirstName = 'Mary', @LastName = 'Jane', @PasswordHash = 'abcd1234fve'
*******************/

CREATE PROCEDURE [dbo].[UserDataUpdate] 
	@UserID INT,
	@FirstName NVARCHAR(250),
	@LastName NVARCHAR(250),
	@Email NVARCHAR(350),
	@PasswordHash NVARCHAR(250),
	@IsDeleted BIT = 0
AS
BEGIN

	BEGIN TRY

		UPDATE u
		SET
			 u.FIrstName		= @FirstName
			,u.LastName			= @LastName
			,u.Email			= @Email
			,u.PasswordHash		= @PasswordHash
			,u.IsDeleted		= @IsDeleted
			,u.LastUpdatedOn	= GETDATE()
		FROM Users u
		WHERE UserID = @UserID
			

	END TRY
	BEGIN CATCH

		SELECT 
			ERROR_MESSAGE()		AS ErrorMessage,
			ERROR_LINE()		AS LineNumber
			
	END CATCH

END