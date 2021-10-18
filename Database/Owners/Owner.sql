USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Owners.Owner_READ', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_READ
	IF OBJECT_ID('Owners.Owner_LIST', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_LIST
	IF OBJECT_ID('Owners.Owner_CREATE', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_CREATE
	IF OBJECT_ID('Owners.Owner_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_UPDATE
	IF OBJECT_ID('Owners.Owner_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_ENABLE
	IF OBJECT_ID('Owners.Owner_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_DISABLE
	IF OBJECT_ID('Owners.Owner_DELETE', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_DELETE
*/

CREATE PROCEDURE Owners.Owner_READ
	@Option      TINYINT = NULL,
	@OwnerId     INT = NULL,
	@OwnerName   NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = '',
	@CompayId    INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.OwnerId, a.OwnerName, a.Document, a.Telephone, a.Mobile, 
				a.Email, a.Address, a.Observation, a.CompayId
		FROM 	Owners.Owner a
		WHERE 	(@OwnerId     IS NULL OR a.OwnerId = @OwnerId)
		  AND 	(ISNULL(@OwnerName, '')   = ''    OR a.OwnerName LIKE '%' + TRIM(@OwnerName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Owners.Owner_READ @Option = null, @OwnerId = null, @OwnerName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = '', @CompayId = null
END
GO


CREATE PROCEDURE Owners.Owner_LIST
	@Option      TINYINT = NULL,
	@OwnerId     INT = NULL,
	@OwnerName   NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = '',
	@CompayId    INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.OwnerId OwnerId, a.OwnerName OwnerName
		FROM 	Owners.Owner a
		WHERE 	(@OwnerId     IS NULL OR a.OwnerId = @OwnerId)
		  AND 	(ISNULL(@OwnerName, '')   = ''    OR a.OwnerName LIKE '%' + TRIM(@OwnerName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Owners.Owner_LIST @Option = null, @OwnerId = null, @OwnerName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = '', @CompayId = null
END
GO


CREATE PROCEDURE Owners.Owner_CREATE
	@Option      TINYINT = NULL,
	@OwnerName   NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500),
	@CompayId    INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedOwnerId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Owners.Owner (OwnerName, Document, Telephone, Mobile, Email,
								Address, Observation, CompayId)
							VALUES (@OwnerName, @Document, @Telephone, @Mobile, @Email,
								@Address, @Observation, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedOwnerId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedOwnerId OwnerId
	-- EXEC Owners.Owner_CREATE @Option = null, @OwnerName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null, @CompayId = null
END
GO


CREATE PROCEDURE Owners.Owner_UPDATE
	@Option      TINYINT = NULL,
	@OwnerId     INT,
	@OwnerName   NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500),
	@CompayId    INT
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
			IF NOT EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Owners.Owner
			SET 	OwnerName   = @OwnerName,
					Document    = @Document,
					Telephone   = @Telephone,
					Mobile      = @Mobile,
					Email       = @Email,
					Address     = @Address,
					Observation = @Observation,
					CompayId    = @CompayId
			WHERE 	OwnerId = @OwnerId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @OwnerId OwnerId
	-- EXEC Owners.Owner_UPDATE @Option = null, @OwnerId = null, @OwnerName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null, @CompayId = null
END
GO


CREATE PROCEDURE Owners.Owner_ENABLE
	@OwnerId INT
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
		IF NOT EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Owners.Owner
		SET		
		WHERE	Active = 0
		  AND 	OwnerId = @OwnerId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @OwnerId OwnerId
	-- EXEC Owners.Owner_ENABLE @OwnerId = null
END
GO


CREATE PROCEDURE Owners.Owner_DISABLE
	@OwnerId INT
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
		IF NOT EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Owners.Owner
		SET		
		WHERE	Active = 1
		  AND 	OwnerId = @OwnerId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @OwnerId OwnerId
	-- EXEC Owners.Owner_DISABLE @OwnerId = null
END
GO


CREATE PROCEDURE Owners.Owner_DELETE
	@OwnerId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Owners.Owner
		WHERE  OwnerId = @OwnerId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @OwnerId OwnerId
	-- EXEC Owners.Owner_DELETE @OwnerId = null
END
GO


