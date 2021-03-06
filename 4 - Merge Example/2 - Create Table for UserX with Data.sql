/*
	Used for the Create Table statement for the Users CompanyX Table, and Data for Users CompanyX.

*/

IF NOT EXISTS (SELECT 1 
        FROM INFORMATION_SCHEMA.TABLES 
        WHERE TABLE_TYPE='BASE TABLE' 
        AND TABLE_NAME='Users_CompanyX') 
		BEGIN

			CREATE TABLE Users_CompanyX (
			  Users_CompanyXID INT IDENTITY(1,1) PRIMARY KEY,
			  FirstName NVARCHAR(250),
			  LastName NVARCHAR(250),
			  Email NVARCHAR(200),
			  Age INT,
			  Addr1 NVARCHAR(2000),
			  City NVARCHAR(500),
			  State NVARCHAR(100),
			  IsDeleted BIT
			)

		INSERT INTO Users_CompanyX
			(FirstName, LastName, Email, Age, Addr1, City, State, IsDeleted)
		VALUES	
			('Samuel', 'Rither', 'SRither@CompanyX.com', 34, NULL, 'El Paso', 'California', 0),
			('Henry', 'Carther', 'HCarthher@CompanyX.com', 48, NULL, 'El Paso', 'California', 0),
			('Sarah', 'Miles', 'SMiles@CompanyX.com', 37, NULL, 'El Paso', 'California', 0),
			('Kyle', 'Smith', 'KSmith@CompanyX.com', 34, NULL, 'El Paso', 'California', 1),
			('Berry', 'Goodfeller', 'BGoodfeller@CompanyX.com', 27, NULL, 'El Paso', 'California', 0),
			('Steven', 'Biles', 'SBiles@CompanyX.com', 32, NULL, 'El Paso', 'California', 0),
			('Julie', 'Feather', 'JFeather@CompanyX.com', 43, NULL, 'El Paso', 'California', 1),
			('Kyrie', 'Will', 'KWill@CompanyX.com', 27, NULL, 'El Paso', 'California', 0),
			('Samuel', 'Philson', 'SPhilson@CompanyX.com', 29, NULL, 'El Paso', 'California', 0),
			('Karen', 'Paulson', 'KPaulson@CompanyX.com', 33, NULL, 'El Paso', 'California', 0),
			('Alex', 'Rodriguez', 'ARodriguez@CompanyX.com', 29, NULL, 'Riverside', 'California', 0),
			('Samuel', 'Philson', 'SPhilson@CompanyX.com', 29, NULL, 'Riverside', 'California', 0),
			('Maritza', 'Oswald', 'MOswald@CompanyX.com', 26, NULL, 'Riverside', 'California', 0),
			('Scarlett', 'Leal', 'SLeal@CompanyX.com', 28, NULL, 'Riverside', 'California', 1)

		PRINT 'Created Users for CompanyX';
		END
  