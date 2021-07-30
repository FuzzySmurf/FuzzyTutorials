/*
	Used as the Audit Tablefor the Users Table.
*/


CREATE TABLE dbo.Users_Audit (
	Users_AuditID INT IDENTITY(1,1) PRIMARY KEY,
	UserID INT FOREIGN KEY REFERENCES USERS(UserID),
	PasswordHash_Old NVARCHAR(250) NULL,
	PasswordHash_New NVARCHAR(250) NULL,
	IsDeleted_Old BIT NULL,
	IsDeleted_New BIT NULL,
	UpdatedOn DATETIME2,
	UpdatedBy NVARCHAR(250)
)