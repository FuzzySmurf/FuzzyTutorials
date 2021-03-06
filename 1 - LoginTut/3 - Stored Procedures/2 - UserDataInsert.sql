/*******************
Description:
	Used to insert new users into the database.

Example:
	EXEC UserDataInsert @FirstName = 'John', @LastName = 'Doe', @EMail = 'John@Doe.com', @PasswordHash = 'fadfvae5g345g4e5rg'
	select top 1 * from Users
	
*******************/

CREATE PROCEDURE [dbo].[UserDataInsert] 
	@FirstName NVARCHAR(250),
	@LastName NVARCHAR(250),
	@EMail NVARCHAR(350),
	@PasswordHash NVARCHAR(250)
AS
BEGIN

	BEGIN TRY

		--Variables
		DECLARE @pNow DATETIME2 = GETDATE()
		DECLARE @pUserID INT = 0;

		--Verify that this User Email hasn't already been created.
		IF NOT EXISTS (SELECT TOP 1 1 FROM Users WHERE Email = @EMail)
		BEGIN
			INSERT INTO Users
				(FirstName, LastName, Email, PasswordHash, CreatedOn, IsDeleted)
			VALUES
				(@FirstName, @LastName, @EMail, @PasswordHash, @pNow, 0)

			--Assign @pUserID = Identity that was just created.
			SET @pUserID = SCOPE_IDENTITY()

			PRINT 'User has been created'
		END
		ELSE
		BEGIN
			PRINT 'User CANNOT be created, as it already exists.'
		END
		
		SELECT @pUserID AS UserID;

	END TRY
	BEGIN CATCH

		SELECT 
			ERROR_MESSAGE()		AS ErrorMessage,
			ERROR_LINE()		AS LineNumber
			
	END CATCH

END