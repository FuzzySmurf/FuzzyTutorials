/*
	If you are using this tutorial only, then you need the create table statement.
	Description:
		This follows from the original Create Table Statement in the original Login Tut Tutorial.
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

