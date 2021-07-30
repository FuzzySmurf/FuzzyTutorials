/*
	Used for the Create Table statement for the Users Table.
*/


CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) PRIMARY KEY,
	[FIrstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[Email] [nvarchar](350) NULL,
	[PasswordHash] [nvarchar](250) NULL,
	[CreatedOn] [datetime2](7) NULL,
	[LastUpdatedOn] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL,
)

