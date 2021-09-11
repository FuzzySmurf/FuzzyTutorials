
DECLARE @pNow DATETIME2 = GETDATE();

IF NOT EXISTS(SELECT TOP 1 1 FROM Users WHERE LastName = 'Banner')
BEGIN
	INSERT INTO Users
	(FirstName, LastName, Email, PasswordHash, CreatedOn, IsDeleted, LastUpdatedOn)
	VALUES
	('John','Banner','John@Doe.com', 'abcd1234fve', @pNow, 0, @pNow),
	('Phil','Johnson','Phil@Johnson.com', 'abcd1234fve', @pNow, 0, @pNow),
	('John','Johnson','John@Johnson.com', 'abcd1234fve', @pNow, 0, @pNow),
	('Gibberish','Gib','asd@asddvfdsvdf.com', 'abcd1234fve', @pNow, 0, @pNow),
	('Jamie','Lannister','Jamie@Lannister.com', 'abcd1234fve', @pNow, 0, @pNow),
	('Tyrionne','Lannister','Tyrionne@Lannister.com', 'abcd1234fve', @pNow, 0, @pNow);
END

select * from Users