/*******************
Description:
	Used to Insert or Update a Users Data.
		
Examples Procs:
	SELECT * FROM Users
	EXEC UserDataUpSert @UserID = 1, @EMail = 'John@Doe.com', @FirstName = 'Bruce', @LastName = 'Banner', @PasswordHash = 'abcd1234fve'

	EXEC UserDataUpSert @UserID = 0, @EMail = 'Phil@Johnson.com', @FirstName = 'Phil', @LastName = 'Johnson', @PasswordHash = 'abcd1234fve'
*******************/

CREATE PROCEDURE [dbo].[UserDataUpSert] 
	@FirstName NVARCHAR(250),
	@LastName NVARCHAR(250),
	@Email NVARCHAR(350),
	@PasswordHash NVARCHAR(250),
	@UserID INT = NULL,
	@IsDeleted BIT = 0
AS
BEGIN

	BEGIN TRY

		--Variables
		DECLARE @pUserExists BIT = 0;
		DECLARE @pNow DATETIME2 = GETDATE();
		DECLARE @pUserID INT;
		
		--Verify if User Exists.
		SET @pUserExists = (SELECT TOP 1 1 FROM Users WHERE UserID = @UserID)

		--If User Exists, Update
		IF (@pUserExists = 1)
		BEGIN
			
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

			SET @pUserID = @UserID;
			PRINT 'User has been Updated!';
				
		END
		ELSE --If User does not exist, Insert new user record.
		BEGIN
			INSERT INTO dbo.Users
				(FirstName, LastName, Email, PasswordHash, CreatedOn, LastUpdatedOn, IsDeleted)
			VALUES
				(@FirstName, @LastName, @Email, @PasswordHash, @pNow, @pNow, @IsDeleted)

			--Assign @pUserID = Identity that was just created.
			SET @pUserID = SCOPE_IDENTITY();
			PRINT 'User has been Created!';
		END

		--Select UserID Reference.
		SELECT @pUserID as UserID;

	END TRY
	BEGIN CATCH

		SELECT 
			ERROR_MESSAGE()		AS ErrorMessage,
			ERROR_LINE()		AS LineNumber
			
	END CATCH

END