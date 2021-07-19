Quick Instructions for Running the Scripts:

1. If you don't already, I recommend making a database for yourself, and implement all the scripts you run,
	under the given database. otherwise, the given scripts may default under Folder: System Databases/Master

2. Run the '2 - Create Table' Folder in numerical order in your given database.

3. Run the '3 - Stored Procedures' Folder in numerical order in your given database.

4. TESTING YOUR SCRIPTS:
	i. You may Test your scripts by running the following:
	
		EXEC UserDataInsert @FirstName = 'John', @LastName = 'Doe', @EMail = 'John@Doe.com', @PasswordHash = 'fadfvae5g345g4e5rg'
		--After the execute, it should show records in the select statement.
		select * from Users
	
	
	ii. After Inserting, you may then Run the 'Example Procs' To Test the Return Codes:
	
		EXEC UserDataGet @EMail = 'John@Doe.com', @PasswordHash = 'fadfvae5g345g4e5rg'
		EXEC UserDataGet @EMail = 'John@Doe.com', @PasswordHash = 'asdfsadgsd'
		EXEC UserDataGet @EMail = 'Jane@Marry.com', @PasswordHash = 'fadfvae5g345g4e5rg'
		
5. Enjoy.