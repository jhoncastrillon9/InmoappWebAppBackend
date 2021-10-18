USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Companies.Company_READ', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_READ
	IF OBJECT_ID('Companies.Company_LIST', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_LIST
	IF OBJECT_ID('Companies.Company_CREATE', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_CREATE
	IF OBJECT_ID('Companies.Company_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_UPDATE
	IF OBJECT_ID('Companies.Company_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_ENABLE
	IF OBJECT_ID('Companies.Company_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_DISABLE
	IF OBJECT_ID('Companies.Company_DELETE', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_DELETE
*/

CREATE PROCEDURE Companies.Company_READ
	@Option      TINYINT = NULL,
	@CompayId    INT = NULL,
	@CompanyName NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = ''
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.CompayId, a.CompanyName, a.Document, a.Telephone, a.Mobile, 
				a.Email, a.Address, a.Observation
		FROM 	Companies.Company a
		WHERE 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
		  AND 	(ISNULL(@CompanyName, '') = ''    OR a.CompanyName LIKE '%' + TRIM(@CompanyName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
	END

	-- EXEC Companies.Company_READ @Option = null, @CompayId = null, @CompanyName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = ''
END
GO


CREATE PROCEDURE Companies.Company_LIST
	@Option      TINYINT = NULL,
	@CompayId    INT = NULL,
	@CompanyName NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.CompayId CompanyId, a.CompanyName CompanyName
		FROM 	Companies.Company a
		WHERE 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
		  AND 	(ISNULL(@CompanyName, '') = ''    OR a.CompanyName LIKE '%' + TRIM(@CompanyName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
	END

	-- EXEC Companies.Company_LIST @Option = null, @CompayId = null, @CompanyName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = ''
END
GO


CREATE PROCEDURE Companies.Company_CREATE
	@Option      TINYINT = NULL,
	@CompanyName NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedCompayId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Companies.Company (CompanyName, Document, Telephone, Mobile, Email,
								Address, Observation)
							VALUES (@CompanyName, @Document, @Telephone, @Mobile, @Email,
								@Address, @Observation)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedCompayId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedCompayId CompayId
	-- EXEC Companies.Company_CREATE @Option = null, @CompanyName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null
END
GO


CREATE PROCEDURE Companies.Company_UPDATE
	@Option      TINYINT = NULL,
	@CompayId    INT,
	@CompanyName NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Companies.Company
			SET 	CompanyName = @CompanyName,
					Document    = @Document,
					Telephone   = @Telephone,
					Mobile      = @Mobile,
					Email       = @Email,
					Address     = @Address,
					Observation = @Observation
			WHERE 	CompayId = @CompayId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @CompayId CompayId
	-- EXEC Companies.Company_UPDATE @Option = null, @CompayId = null, @CompanyName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null
END
GO


CREATE PROCEDURE Companies.Company_ENABLE
	@CompayId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Companies.Company
		SET		
		WHERE	Active = 0
		  AND 	CompayId = @CompayId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @CompayId CompayId
	-- EXEC Companies.Company_ENABLE @CompayId = null
END
GO


CREATE PROCEDURE Companies.Company_DISABLE
	@CompayId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Companies.Company
		SET		
		WHERE	Active = 1
		  AND 	CompayId = @CompayId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @CompayId CompayId
	-- EXEC Companies.Company_DISABLE @CompayId = null
END
GO


CREATE PROCEDURE Companies.Company_DELETE
	@CompayId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Companies.Company
		WHERE  CompayId = @CompayId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @CompayId CompayId
	-- EXEC Companies.Company_DELETE @CompayId = null
END
GO


