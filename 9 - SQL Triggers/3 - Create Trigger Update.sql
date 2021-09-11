CREATE TRIGGER TriggerUserUpdated ON Users
AFTER UPDATE
as
BEGIN
	DECLARE @userID INT;

	SELECT @userID = ins.UserID FROM INSERTED ins;

	UPDATE u
	SET u.IsUpdated = 1
	FROM dbo.Users u
	WHERE u.UserID = @userID
END